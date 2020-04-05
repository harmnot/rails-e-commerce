class Product < ApplicationRecord
  has_one_attached :photo
  validates_presence_of :name, message: 'Product name required'
  validates_presence_of :stock, message: 'Stock product required'
  validates_presence_of :price, message: 'Product price required'

end
