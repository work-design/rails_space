module Space
  class Admin::RoomsController < Admin::BaseController
    before_action :set_station
    before_action :set_new_room, only: [:new, :create]

    def index
      @rooms = @station.rooms.page(params[:page])
    end

    private
    def set_station
      @station = Station.find params[:station_id]
    end

    def set_new_room
      @room = @station.rooms.build room_params
    end

    def room_params
      params.fetch(:room, {}).permit(
        :name,
        :code,
        :floor
      )
    end
  end
end
