class Post < ApplicationRecord
  validates :title, presence: true
  validates :summary, presence: true 
  validates :body, presence: true   
end
