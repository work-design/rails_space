module Space
  class Admin::StationsController < Admin::BaseController

    def new
      @station = Station.new
      @station.area = Ship::Area.new
    end

    private
    def station_params
      p = params.fetch(:station, {}).permit(
        :area_id,
        :name,
        :detail,
        :area_ancestors
      )
      p.merge! default_form_params
    end

  end
end
