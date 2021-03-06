class Album < ApplicationRecord

  validates :title, :description, presence: true
  has_many :album_items
  has_many :items, through: :album_items
  belongs_to :user
  

end
