module Space
  class Me::GridsController < Me::BaseController
    before_action :set_room
    before_action :set_grid, only: [:show, :edit, :qrcode, :in, :out, :update, :destroy]
    before_action :set_new_grid, only: [:new, :create]
    before_action :set_item_from_scan, only: [:in, :out]

    def index
      @grids = @room.grids.includes(room: [:building, :station]).page(params[:page])
    end

    def in
      if @item
        @item.assign_attributes params.permit(:room_id)
        @item.grid = @grid
        @item.state = 'grid_in'
        @item.save
      end
    end

    def out
      if @item
        @item.assign_attributes params.permit(:room_id)
        @item.grid = @grid
        @item.state = 'grid_out'
        @item.save
      end
    end

    private
    def set_room
      @room = Room.find params[:room_id]
    end

    def set_grid
      @grid = @room.grids.find params[:id]
    end

    def set_new_grid
      @grid = @room.grids.build grid_params
    end

    def set_item_from_scan
      pi = params[:result].scan(RegexpUtil.more_between('production_items/', '/qrcode'))
      if pi.present?
        @item = Factory::ProductionItem.find pi[0]
      end
    end

    def grid_params
      params.fetch(:grid, {}).permit(
        :name,
        :code,
        :width,
        :length,
        :height
      )
    end

  end
end
