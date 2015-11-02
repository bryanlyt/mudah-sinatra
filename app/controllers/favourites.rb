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