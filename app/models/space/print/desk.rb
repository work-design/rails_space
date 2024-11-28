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
      total = 0

      pr.text "#{self.class.human_attribute_name(:name)}：#{name}"
      trade_items.where(status: 'ordered').each do |item|
        total += item.amount
        pr.text("  #{item.good_name} #{item.number.to_human} x #{item.single_price.to_money.to_s}") if item.good
      end
      pr.text "合计：#{total.to_money.to_s}"
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
