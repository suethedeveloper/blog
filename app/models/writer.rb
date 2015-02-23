class Writer < ActiveRecord::Base
  validates :first_name, :last_name, 
              presence: true, length: 4..20
  validates :age, numericality: {only_integer: true}
  has_many :posts, dependent: :destroy 
  # accepts_nested_attributes_for :posts 
  #has_attached_file :photo, :styles => { :medium => "100x100>", :thumb => "50x50>" }
end
