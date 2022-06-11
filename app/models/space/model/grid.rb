module Space
  module Model::Grid
    extend ActiveSupport::Concern

    included do
      attribute :name, :string
      attribute :code, :string
      attribute :width, :integer
      attribute :height, :integer
      attribute :length, :integer
      attribute :floor, :integer

      belongs_to :room

      has_many :production_items, class_name: 'Factory::ProductionItem', dependent: :nullify
    end

    def qr_code
      [code, room.code, room.building&.code, room.station.code].compact.join('-')
    end

    def qrcode_url
      QrcodeHelper.data_url(qr_code)
    end

    def enter_url
      Rails.application.routes.url_for(controller: 'space/me/grids', action: 'qrcode', room_id: room_id, id: self.id, host: room.station.organ.host)
    end

    def qrcode_enter_url
      QrcodeHelper.data_url(enter_url)
    end

  end
end
