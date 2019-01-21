class ScheduleJob < ApplicationJob
  queue_as :default

  CURRENT_TIME = Time.zone.now.midnight.strftime("%I:%M%p")

  def perform(*args)
    Schedule.all.each do |schedule|
      case schedule.frequency
      when 'once'
        frequency_once(schedule)
      when 'daily'
        frequency_daily(schedule)
      when 'weekly'
        #
      when 'monthly'
        #
      end
    end
  end

  private

  def frequency_once(schedule)
    if schedule.start_date == Date.today && schedule.start_time.strftime("%I:%M%p") == CURRENT_TIME
      inverse_state = schedule.inversed
      MqttPublishJob.perform_later(schedule.device, inverse_state)

      end_date_utc = Time.zone.parse([schedule.end_date.to_s, schedule.end_time.strftime('%H:%M')].join(' ')).utc
      MqttPublishJob.set(wait_until: end_date_utc).perform_later(schedule.device, !inverse_state)
    end
  end

  def frequency_daily(schedule)
    if schedule.start_date == Date.today && CURRENT_TIME == '12:00AM'
      inverse_state = false
      dates = (schedule.start_date..schedule.end_date).to_a

      dates.each do |date|
        start_time_utc = Time.zone.parse([date.to_s, schedule.start_time.strftime('%H:%M')].join(' ')).utc
        end_time_utc = Time.zone.parse([date.to_s, schedule.end_time.strftime('%H:%M')].join(' ')).utc

        MqttPublishJob.set(wait_until: start_time_utc).perform_later(schedule.device, inverse_state)
        MqttPublishJob.set(wait_until: end_time_utc).perform_later(schedule.device, !inverse_state)
      end
    end
  end

end
