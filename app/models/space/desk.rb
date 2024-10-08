module Space
  class Desk < ApplicationRecord
    include Model::Desk

    def print
      r = room.station.organ.device.print(
        data: to_tspl
      )
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
