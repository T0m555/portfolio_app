class Item < ApplicationRecord

  validates :title, :url, :description, presence: true

  belongs_to :user
  has_many :album_items
  has_many :albums, through: :album_items
end