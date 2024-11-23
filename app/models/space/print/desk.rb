module Space
  module Print::Desk
    extend ActiveSupport::Concern

    included do

    end

    def print
      return unless organ.device
      organ.device.print(
        data: to_tspl
      )
    end

    def print_all
      return unless organ.device
      organ.device.print(
        data: to_esc,
        mode: 3,
        cmd_type: 'ESC'
      )
    end

    def to_esc
      pr = BaseEsc.new
      trade_items.where(status: 'ordered').group_by(&:order).each do |order, items|
        pr.text "#{order.class.human_attribute_name(:created_at)}：#{order.created_at.to_fs(:wechat)}"
        pr.text '已下单：'
        items.includes(:good).each do |item|
          pr.text("    #{item.good_name} x #{item.number.to_human}") if item.good
        end
        pr.text "#{order.class.human_attribute_name(:item_amount)}：#{order.item_amount.to_money.to_s}" if order.item_amount != order.amount
        pr.text "#{order.class.human_attribute_name(:adjust_amount)}：#{order.adjust_amount.to_money.to_s}" if order.adjust_amount.to_d != 0
        pr.text "#{order.class.human_attribute_name(:amount)}：#{order.amount.to_money.to_s}"
        pr.text "#{order.class.human_attribute_name(:payment_status)}：#{order.payment_status_i18n}"
      end
      pr.render
      pr.render_raw
    end

    def to_tspl
      ts = BaseTspl.new
      ts.bar(height: 20)
      ts.qrcode(product_url, x: 20, y: 10, cell_width: 10)
      ts.text(name, x: 320, scale: 2)
      ts.middle_text('扫码点餐', x: 320)
      ts.render
    end

    def to_cpcl
      cpcl = BaseCpcl.new
      cpcl.text code
      cpcl.right_qrcode(product_url)
      cpcl.render
    end

  end
end
