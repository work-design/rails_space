module Space
  module Model::Room
    extend ActiveSupport::Concern

    included do
      attribute :name, :string
      attribute :code, :string
      attribute :floor, :integer
      attribute :grids_count, :integer, default: 0

      belongs_to :station, counter_cache: true
      belongs_to :building, optional: true

      has_many :grids
      has_many :production_items, class_name: 'Factory::ProductionItem', dependent: :nullify
    end

    def enter_url
      Rails.application.routes.url_for(controller: 'space/me/rooms', action: 'qrcode', id: self.id)
    end

    def qrcode_enter_url
      QrcodeHelper.data_url(enter_url)
    end

  end
end
