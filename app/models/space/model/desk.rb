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
      [area.full_name, detail, name].compact_blank.join(' ')
    end

    def qr_code
      [code, room.code, room.building&.code, room.station.code].compact.join('-')
    end

    def qrcode_url
      QrcodeHelper.data_url(qr_code)
    end

    def enter_url
      Rails.application.routes.url_for(controller: 'space/desks', action: 'qrcode', id: id)
    end

    def qrcode_enter_url
      QrcodeHelper.data_url(enter_url)
    end

  end
end
