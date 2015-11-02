class Favourite < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  belongs_to :user
  belongs_to :product

  def self.find_product(product_id)
    @product = Product.find(product_id)
  end
end
