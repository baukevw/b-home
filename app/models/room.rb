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
  has_many :devices

   scope :area_ordered, -> { all.sort_by(&:name_with_area) }

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def name_with_area
    "#{self.area.name} - #{self.name}"
  end
end
