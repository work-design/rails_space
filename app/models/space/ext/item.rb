module Space
  module Ext::Item
    extend ActiveSupport::Concern

    included do
      belongs_to :desk, class_name: 'Space::Desk', optional: true
      belongs_to :station, class_name: 'Space::Station', optional: true

      has_many :desk_brothers, ->(o) { where(desk_id: o.desk_id) }, class_name: self.name, primary_key: :organ_id, foreign_key: :organ_id

      after_update_commit :send_notice_to_desk_ordered, if: -> { saved_change_to_order_id? }
      after_commit :send_notice_to_desk, on: [:create, :destroy]
    end

    def send_notice_to_desk_ordered
      broadcast_action_to(
        "desk_count_#{organ_id}",
        action: :update,
        target: "ordered_count_#{desk_id}",
        content: desk_brothers.status_ordered.count
      )
      send_notice_to_desk
    end

    def send_notice_to_desk
      broadcast_action_to(
        "desk_count_#{organ_id}",
        action: :update,
        target: "desk_count_#{desk_id}",
        content: desk_brothers.carting.count
      )
    end

  end
end
