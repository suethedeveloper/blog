class Writer < ActiveRecord::Base
  validates :first_name, :last_name, 
              presence: true, length: 4..20
  validates :age, numericality: {only_integer: true}
  has_many :posts, dependent: :destroy  
end
