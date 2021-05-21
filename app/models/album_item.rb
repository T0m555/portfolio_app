class AlbumItem < ApplicationRecord
  belongs_to :album
  belongs_to :item
end
