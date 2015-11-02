class Favourite < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  belongs_to :user
  belongs_to :product

  def self.find_product(product_id)
    @product = Product.find(product_id)
  end

  def self.list_user_favourite(user_id)
    @favourites = Favourite.where(user_id: user_id)
  end

  def self.list_product_favourite(product_id)
  	@favprod = Favourite.where(product_id: product_id)
	end

end
