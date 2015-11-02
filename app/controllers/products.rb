# Display single product
get '/product/:id' do
  @product = Product.find_by(id: params[:id])
  # @favprod = Favourite.list_product_favourite(params[:product_id])
  erb :product
end

# Create a new product
get '/add_new_product' do
  if logged_in?
      erb :"add_new_product"
  else
      redirect to ('/signup')
  end
end

# Submit a new product
post '/post_new_product' do
  title = params[:title]
  description = params[:description]
  location = params[:location]
  price = params[:price]

  if Product.existing_product?(title) == false

  @newproduct = Product.create(title: title, description: description, location: location, price: price, user_id: session[:user_id])
    redirect to ('/profile')
  else
    redirect to ('/profile')
  end

end

# Edit product
get '/product/:product_id/edit' do
  user_id = session[:user_id]
  @current_user = User.find(user_id)
  @current_product = Product.find(params[:product_id])
  erb :edit
end

put '/product/:product_id/edit' do
  product = Product.find(params[:product_id])
  title = params[:title]
  description = params[:description]
  location = params[:location]
  price = params[:price]
  product.update(title: title, description: description, location: location, price: price)
  redirect to ('/profile')
end

# Delete product
post '/product/:id/delete' do
  product = Product.find(params[:id])
  product.destroy!
  redirect to ('/profile')
end

