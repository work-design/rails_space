module Space
  module Model::Desk
    extend ActiveSupport::Concern

    included do
      attribute :name, :string
      attribute :code, :string
      attribute :width, :integer
      attribute :height, :integer
      attribute :length, :integer

      belongs_to :room

      has_many :trade_items, class_name: 'Trade::Item', dependent: :nullify
    end

    def content
      [name].compact_blank.join(' ')
    end

    def qr_code
      [code, room.code, room.building&.code, room.station.code].compact.join('-')
    end

    def qrcode_url
      QrcodeHelper.data_url(qr_code)
    end

    def enter_url
      Rails.application.routes.url_for(
        controller: 'space/desks',
        action: 'qrcode',
        id: id,
        host: room.station.organ.host
      )
    end

    def qrcode_enter_url
      QrcodeHelper.data_url(enter_url)
    end

    def product_url
      Rails.application.routes.url_for(
        controller: 'factory/productions',
        desk_id: id,
        host: room.station.organ.host
      )
    end

    def qrcode_product_url
      QrcodeHelper.data_url(product_url)
    end

  end
end
