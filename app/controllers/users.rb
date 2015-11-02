# Register / sign up
post '/register' do
  name = params[:name]
  email = params[:email]
  password = params[:password]

  @new_user = User.create(name: name, email: email, password: password)
  session[:user_id] = @new_user.id

  redirect to ('/profile')
end

# Login
post '/login' do
  email = params[:email]
  password = params[:password]

  @user = User.authenticate(email, password)
  if @user.nil?
    redirect to ('/')
  else
    session[:user_id] = @user.id
    redirect to ('/profile')
  end
end

# User profile
post '/profile' do
  redirect to ('/profile')
end

get '/profile' do
  if session[:user_id].nil?
    redirect to ('/')
  else
    @current_user = User.find(session[:user_id])
    @products = Product.list_user_product(session[:user_id])
    @favourites = Favourite.list_user_favourite(session[:user_id])
    erb :dashboard
  end
end

# Logout
post '/logout' do
  session[:user_id] = nil
  redirect to ('/')
end