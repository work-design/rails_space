module Space
  class DesksController < BaseController
    before_action :set_station

    def index
      q_params = {}
      q_params.merge! default_params

      @desks = @station.desks.default_where(q_params).order(id: :desc).page(params[:page])
    end

    def change
      q_params = {}
      q_params.merge! default_params

      @desks = @station.desks.default_where(q_params).order(id: :desc).page(params[:page])
    end

    def show
    end

    private
    def set_station
      @station = Station.find params[:station_id]
    end

  end
end
