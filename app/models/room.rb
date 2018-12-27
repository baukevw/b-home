# == Schema Information
#
# Table name: rooms
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  icon       :string
#  area_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Room < ApplicationRecord
  belongs_to :area
end
