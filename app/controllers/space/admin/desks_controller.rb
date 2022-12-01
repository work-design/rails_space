module Space
  class Admin::DesksController < Admin::BaseController
    before_action :set_room
    before_action :set_desk, only: [:show, :edit, :update, :destroy]
    before_action :set_new_desk, only: [:new, :create]

    def index
      @desks = @room.desks.includes(room: [:building, :station]).page(params[:page])
    end

    private
    def set_room
      @room = Room.find params[:room_id]
    end

    def set_desk
      @desk = @room.desks.find params[:id]
    end

    def set_new_desk
      @desk = @room.desks.build desk_params
    end

    def desk_params
      params.fetch(:desk, {}).permit(
        :name,
        :code,
        :width,
        :length,
        :height
      )
    end

  end
end
