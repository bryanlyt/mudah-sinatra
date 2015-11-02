class Product < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  belongs_to :user
  has_many :favourites

  def self.list_user_product(user_id)
    @products = Product.where(user_id: user_id)
  end

  def self.existing_product?(title)
    product = Product.find_by(title: title)
    false if product.nil?
  end
end
