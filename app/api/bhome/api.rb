require 'grape-entity'

module Bhome
  class API < Grape::API
    version 'v1'
    format :json
    prefix :api

    get '/areas-rooms-devices' do
      present Area.all, with: Bhome::Entities::AreaEntity
    end

    get '/areas/:id/rooms-devices' do
      present Room.where(area_id: params[:id]).all, with: Bhome::Entities::RoomEntity
    end
  end
end
