module Space
  class StationsController < BaseController
    before_action :set_organ, only: [:show]

    def index
      q_params = {}
      q_params.merge! default_params

      @stations = Station.default_where(q_params).order(id: :desc).page(params[:page])
    end

    def show
    end

    private
    def set_organ
      @organ = Organ.find params[:id]
    end

  end
end
