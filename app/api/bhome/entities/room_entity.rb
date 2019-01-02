module Bhome
  module Entities
    class RoomEntity < Grape::Entity
      expose :id
      expose :name
      expose :in_use_devices, using: Bhome::Entities::DeviceEntity, as: :devices
    end
  end
end
