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
#

class Schedule < ApplicationRecord
  belongs_to :device

  enum frequency: [:once, :daily, :weekly, :monthly]

  scope :active, -> { select{|s| s.end_date_time >= DateTime.now}.sort_by{|e| e[:start_date]} }
  scope :archived, -> { select{|s| s.end_date_time < DateTime.now}.sort_by{|e| e[:end_date]}.reverse }

  def end_date_time
    Time.zone.parse([self.end_date.to_s, self.end_time.strftime('%H:%M')].join(' '))
  end
end
