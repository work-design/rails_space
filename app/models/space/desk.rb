module Space
  class Desk < ApplicationRecord
    include Model::Desk
    include JiaBo::Ext::Device

    def print
      r = room.station.organ.device.print(
        data: to_tspl
      )
    end

    def to_tspl
      ts = BaseTspl.new
      ts.qrcode(product_url, x: 20, y: 10, cell_width: 10)
      ts.text(name, x: 320, scale: 2)
      ts.text('扫码点餐', x:320)
      ts.render
    end

  end
end
