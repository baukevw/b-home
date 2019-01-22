class RemoveScheduledJob < ApplicationJob
  queue_as :default

  def perform(jids)
    Rails.logger.info '== PERFORM REMOVE SCHEDULED JOBS'
    Rails.logger.info jids.inspect

    jids.each do |jid|
      scheduled_job = Sidekiq::ScheduledSet.new.find_job(jid)
      scheduled_job.delete unless scheduled_job.nil?
    end

  end
end
