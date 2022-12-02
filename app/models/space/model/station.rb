module Space
  module Model::Station
    extend ActiveSupport::Concern

    included do
      attribute :name, :string
      attribute :code, :string
      attribute :detail, :string
      attribute :buildings_count, :integer, default: 0
      attribute :rooms_count, :integer, default: 0

      belongs_to :organ, class_name: 'Org::Organ'
      belongs_to :area, class_name: 'Profiled::Area'
      has_taxons :area

      has_many :buildings, dependent: :destroy_async
      has_many :rooms, dependent: :destroy_async

      has_one_attached :logo
    end

    def content

    end

  end
end
