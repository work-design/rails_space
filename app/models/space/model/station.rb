module Space
  module Model::Station
    extend ActiveSupport::Concern

    included do
      attribute :name, :string
      attribute :detail, :string

      belongs_to :organ, class_name: 'Org::Organ'
      belongs_to :area, class_name: 'Profiled::Area'
      has_taxons :area
    end


  end
end
