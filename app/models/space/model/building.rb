module Space
  module Model::Building
    extend ActiveSupport::Concern

    included do
      attribute :name, :string
      attribute :code, :string

      belongs_to :station

      has_many :rooms, dependent: :nullify
    end

  end
end
