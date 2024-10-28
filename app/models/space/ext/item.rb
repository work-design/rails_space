module Space
  module Ext::Item
    extend ActiveSupport::Concern

    included do
      belongs_to :desk, class_name: 'Space::Desk', optional: true
      belongs_to :station, class_name: 'Space::Station', optional: true

      after_create_commit :send_notice_to_desk
    end

    def send_notice_to_desk
      return unless id
      broadcast_action_to(
        desk,
        action: :append,
        target: 'body',
        partial: 'visit',
        locals: { model: self }
      )
    end

  end
end
