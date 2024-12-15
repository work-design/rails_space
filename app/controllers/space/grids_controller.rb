module Space
  class GridsController < BaseController
    before_action :set_grid, only: [:qrcode]

    def qrcode
      redirect_to(
        {
          controller: 'space/me/grids',
          action: 'qrcode',
          room_id: @grid.room_id,
          id: params[:id],
          host: @grid.room.station.organ.host
        },
        allow_other_host: true
      )
    end

    private
    def set_grid
      @grid = Grid.find params[:id]
    end

  end
end
