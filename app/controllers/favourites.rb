# Create favourite for a product 
post '/product/:product_id/fav' do
  product = Product.find(params[:product_id])

# Non-logged in user forbidden to create favourite
    if session[:user_id].nil?
      redirect to ('/')
    else
# Cannot favourite own product
      if product.user_id == session[:user_id]
        redirect to ('/profile')
# Create favourite for the product
      else
        Favourite.create(user_id: session[:user_id], product_id: params[:product_id])
        redirect to ('/profile')
      end
    end
end


# # Get all favourites 
# get "/favourites/:id/all" do
#   @favourites = Favourite.all
#   @products = Product.all
#   @user_id = session[:user].id
#   erb :"favourites/all"
# end

# # Display single favourite
# get '/product/:product_id/fav/:id' do
#   @favourite = Favourite.find_by(id: params[:id])
#   # @favprod = Favourite.list_product_favourite(params[:product_id])
#   erb :profile
# end


# # Delete favourite
# post '/product/:product_id/fav/:id/delete' do
#   favourite = Favourite.find(params[:id])
#   favourite.delete
#   redirect to ('/profile')
# end
