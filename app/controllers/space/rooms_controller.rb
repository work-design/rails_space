module Space
  class RoomsController < BaseController
    before_action :set_room, only: [:qrcode]

    def qrcode
      redirect_to({ controller: 'space/me/rooms', action: 'qrcode', id: params[:id], host: @room.organ.host }, allow_other_host: true)
    end

    private
    def set_room
      @room = Room.find params[:id]
    end

  end
end
