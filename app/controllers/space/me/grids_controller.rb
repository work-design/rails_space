module Space
  class Me::GridsController < Me::BaseController
    before_action :set_room
    before_action :set_grid, only: [:show, :edit, :update, :destroy]
    before_action :set_new_grid, only: [:new, :create]

    def index
      @grids = @room.grids.includes(room: [:building, :station]).page(params[:page])
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
