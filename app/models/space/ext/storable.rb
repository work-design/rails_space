module Space
  module Ext::Storable
    extend ActiveSupport::Concern

    included do
      belongs_to :grid, class_name: 'Space::Grid', optional: true
      belongs_to :room, class_name: 'Space::Room', optional: true
      belongs_to :building, class_name: 'Space::Building', optional: true
      belongs_to :station, class_name: 'Space::Station', optional: true
    end

  end
end
