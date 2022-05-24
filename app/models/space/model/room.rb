module Space
  module Model::Room
    extend ActiveSupport::Concern

    included do
      attribute :name, :string
      attribute :code, :string
      attribute :floor, :integer
      attribute :grids_count, :integer, default: 0

      belongs_to :station
      belongs_to :building, optional: true

      has_many :grids
    end


  end
end
