# HOME PAGE
get '/' do
  @products = Product.all
  erb :index 
end

post '/' do
  redirect to('/')
end
