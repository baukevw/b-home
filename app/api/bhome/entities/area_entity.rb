module Bhome
  module Entities
    class AreaEntity < Grape::Entity
      expose :id
      expose :name
      expose :rooms, using: Bhome::Entities::RoomEntity
    end
  end
end
