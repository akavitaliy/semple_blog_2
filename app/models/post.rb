class Post < ApplicationRecord

  has_rich_text :body

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :summary, presence: true 
  validates :body, presence: true   
end
