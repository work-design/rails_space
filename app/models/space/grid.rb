module Space
  class Grid < ApplicationRecord
    include Model::Grid

    def to_cpcl
      cpcl = BaseCpcl.new
      cpcl.text code
      cpcl.right_qrcode(enter_url)
      cpcl.render
    end

  end
end
