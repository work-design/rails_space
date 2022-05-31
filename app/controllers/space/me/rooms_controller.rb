module Space
  class Me::RoomsController < Me::BaseController
    before_action :set_new_room, only: [:new, :create]
    before_action :set_room, only: [:show, :edit, :qrcode, :in, :out, :update, :destroy]
    before_action :set_item_from_scan, only: [:in, :out]

    def index
      @rooms = @station.rooms.page(params[:page])
    end

    def in
      if @item
        @item.room = @room
        @item.state = 'grid_in'
        @item.save
      end
    end

    def out
      if @item
        @item.room = @room
        @item.state = 'grid_out'
        @item.save
      end
    end

    private
    def set_room
      @room = Room.find params[:id]
    end

    def set_station
      @station = Station.find params[:station_id]
    end

    def set_new_room
      @room = @station.rooms.build room_params
    end

    def set_item_from_scan
      pi = params[:result].scan(RegexpUtil.more_between('production_items/', '/qrcode'))
      if pi.present?
        @item = Factory::ProductionItem.find pi[0]
      end
    end

    def room_params
      params.fetch(:room, {}).permit(
        :name,
        :code
      )
    end
  end
end
