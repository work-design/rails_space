module Space
  module Model::Room
    extend ActiveSupport::Concern

    included do
      attribute :name, :string
      attribute :floor, :integer
    end


  end
end
