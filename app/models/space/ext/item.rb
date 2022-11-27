module Space
  module Ext::Item
    extend ActiveSupport::Concern

    included do
      belongs_to :desk, class_name: 'Space::Desk', optional: true
    end

  end
end
