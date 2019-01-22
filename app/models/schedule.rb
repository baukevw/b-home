# == Schema Information
#
# Table name: schedules
#
#  id         :bigint(8)        not null, primary key
#  start_date :date
#  start_time :time
#  end_date   :date
#  end_time   :time
#  frequency  :integer
#  device_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  inversed   :boolean          default(FALSE)
#  jids       :text
#

class Schedule < ApplicationRecord
  belongs_to :device

  before_destroy :remove_scheduled_jobs

  enum frequency: [:once, :daily, :weekly, :monthly]
  serialize :jids, Array

  scope :active, -> { select{|s| s.end_date_time >= DateTime.now}.sort_by{|e| e[:start_date]} }
  scope :archived, -> { select{|s| s.end_date_time < DateTime.now}.sort_by{|e| e[:end_date]}.reverse }
  scope :future, -> { select{|s| s.start_date_time.strftime('%d-%m-%Y %H:%M') >= DateTime.now.strftime('%d-%m-%Y %H:%M')}.sort_by{|e| e[:start_date]} }

  def start_date_time
    Time.zone.parse([self.start_date.to_s, self.start_time.strftime('%H:%M')].join(' '))
  end

  def end_date_time
    Time.zone.parse([self.end_date.to_s, self.end_time.strftime('%H:%M')].join(' '))
  end

  def remove_scheduled_jobs
    Rails.logger.info '== BEFORE DESTROY =='
    RemoveScheduledJob.perform_later(self.jids)
  end
end
