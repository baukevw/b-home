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

require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
