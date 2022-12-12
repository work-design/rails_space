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
      ts.qrcode(qrcode_product_url)
      ts.text(name, x: 20, y: 15, x_scale: 2, y_scale: 2)
      ts.render
    end

  end
end
