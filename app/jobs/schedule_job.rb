class ScheduleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    current_time = Time.zone.now.strftime("%I:%M%p")

    Schedule.all.future.each do |schedule|
      case schedule.frequency
      when 'once'
        frequency_once(schedule, current_time)
      when 'daily'
        frequency_daily(schedule, current_time)
      when 'weekly'
        #
      when 'monthly'
        #
      end
    end
  end

  private

  def frequency_once(schedule, current_time)
    Rails.logger.info "== ONCE - id: #{schedule.id} =="
    Rails.logger.info schedule.start_date
    Rails.logger.info Date.today
    Rails.logger.info schedule.start_time.strftime("%I:%M%p")
    Rails.logger.info current_time


    if schedule.start_date == Date.today && schedule.start_time.strftime("%I:%M%p") == current_time
      inverse_state = schedule.inversed
      end_date_utc = Time.zone.parse([schedule.end_date.to_s, schedule.end_time.strftime('%H:%M')].join(' ')).utc

      start_job = MqttPublishJob.perform_later(schedule.device, inverse_state)
      end_job = MqttPublishJob.set(wait_until: end_date_utc).perform_later(schedule.device, !inverse_state)

      schedule.jids << start_job.provider_job_id << end_job.provider_job_id
      schedule.save
    else
      Rails.logger.info "Statement false"
    end
  end

  def frequency_daily(schedule, current_time)
    Rails.logger.info "== DAILY - id: #{schedule.id} =="
    if schedule.start_date == Date.today && current_time == '12:00AM'
      inverse_state = schedule.inversed
      dates = (schedule.start_date..schedule.end_date).to_a

      dates.each do |date|
        start_time_utc = Time.zone.parse([date.to_s, schedule.start_time.strftime('%H:%M')].join(' ')).utc
        end_time_utc = Time.zone.parse([date.to_s, schedule.end_time.strftime('%H:%M')].join(' ')).utc

        start_job = MqttPublishJob.set(wait_until: start_time_utc).perform_later(schedule.device, inverse_state)
        end_job = MqttPublishJob.set(wait_until: end_time_utc).perform_later(schedule.device, !inverse_state)

        schedule.jids << start_job.provider_job_id << end_job.provider_job_id
      end

      schedule.save
    else
      Rails.logger.info "Statement false"
    end
  end

end
