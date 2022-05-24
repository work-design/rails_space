module Space
  class Admin::StationsController < Admin::BaseController

    def new
      @station = Station.new
      @station.area = Profiled::Area.new
    end

    private
    def station_params
      p = params.fetch(:station, {}).permit(
        :name,
        :detail,
        :area_ancestors
      )
      p.merge! default_form_params
    end

  end
end
