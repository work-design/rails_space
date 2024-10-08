module Space
  class Admin::GridsController < Admin::BaseController
    before_action :set_room
    before_action :set_grid, only: [:show, :edit, :update, :destroy, :actions, :print_data]
    before_action :set_new_grid, only: [:new, :create]

    def index
      @grids = @room.grids.includes(room: [:building, :station]).page(params[:page])
    end

    def print_data
      render json: @grid.to_cpcl.bytes
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
