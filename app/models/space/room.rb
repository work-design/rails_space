module Space
  class Room < ApplicationRecord
    include Model::Room

    def to_cpcl
      cpcl = BaseCpcl.new
      cpcl.text code
      cpcl.right_qrcode(enter_url)
      cpcl.render
    end

  end
end
