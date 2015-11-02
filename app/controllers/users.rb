# Register / sign up 
get '/signup' do
  erb :"signup"
end

post '/register' do 
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    @error = @user.errors.full_messages[0]
    erb :"users/new"
  end
end

# Login
post '/login' do
  @login = User.authenticate(params[:user]["email"], params[:user]["password"])
  case @login
  when "username_invalid"
    @error ="Invalid email entered"
    erb :"login"
  when "password_invalid"
    @error ="Invalid password entered for username #{params[:user]["email"]}"
    erb :"login"
  else 
    session[:user_id] = @login
    redirect to ('/')
  end 
end

# User profile
get '/profile' do
  if session[:user_id].nil?
    redirect to ('/')
  else
    @current_user = User.find(session[:user_id])
    @products = Product.list_user_product(session[:user_id])
    @favourites = Favourite.list_user_favourite(session[:user_id])
    erb :profile
  end
end

# Logout
get '/logout' do
  session[:user_id] = nil
  redirect to ('/')
end

