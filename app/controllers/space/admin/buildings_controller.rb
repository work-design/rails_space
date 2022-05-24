module Space
  class Admin::BuildingsController < Admin::BaseController
    before_action :set_station
    before_action :set_new_building, only: [:new, :create]

    def index
      @buildings = @station.buildings.page(params[:page])
    end

    private
    def set_station
      @station = Station.find params[:station_id]
    end

    def set_new_building
      @building = @station.buildings.build building_params
    end

    def building_params
      params.fetch(:building, {}).permit(
        :name,
        :code
      )
    end

  end
end
