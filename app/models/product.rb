class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  
  mount_uploader :image, ProductImageUploader
end
