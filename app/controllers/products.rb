# Display single product
get '/product/:id' do
  @product = Product.find(params[:id])
  erb :product
end

# Create new product
post '/add_new_product' do
  title = params[:title]
  description = params[:description]
  location = params[:location]
  price = params[:price]
end

# Edit product
get '/product/:product_id/edit' do
  user_id = session[:user_id]
  @current_user = User.find(user_id)
  @current_product = Product.find(params[:product_id])
  erb :edit
end

post '/product/:product_id/edit' do
  product = Product.find(params[:product_id])
  title = params[:title]
  description = params[:description]
  location = params[:location]
  price = params[:price]
  product.update(title: title, description: description, location: location, price: price)
  redirect to ('/product/:product_id')
end

# Delete product
post '/product/:id/delete' do
  product = Product.find(params[:id])
  product.destroy!
  redirect to ('/profile')
end

