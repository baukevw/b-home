module Bhome
  module Entities
    class DeviceEntity < Grape::Entity
      expose :id
      expose :name
    end
  end
end
