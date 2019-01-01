module Bhome
  module Entities
    class RoomEntity < Grape::Entity
      expose :id
      expose :name
      expose :devices, using: Bhome::Entities::DeviceEntity
    end
  end
end
