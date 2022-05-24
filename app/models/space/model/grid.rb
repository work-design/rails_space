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
    end


  end
end
