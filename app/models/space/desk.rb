module Space
  class Desk < ApplicationRecord
    include Model::Desk
    include Print::Desk

  end
end
