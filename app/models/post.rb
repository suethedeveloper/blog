class Post < ActiveRecord::Base
  belongs_to :writer
  validates :title, :body, :category, presence: true
  validates :title, length: {minimum: 3}   
end
