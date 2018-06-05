require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
also_reload('./models/*')
require_relative('./models/pizza_order')

get'/pizza-orders' do
  @order = PizzaOrder.all()
  erb(:index)
end
#route- an array of pizza order objects

get'/pizza-orders/new' do
  erb(:new)
end

get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

post '/pizza-orders/:id/delete' do
  order = PizzaOrder.find(params[:id])
  order.delete
  redirect '/pizza-orders'
end


get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza-orders/:id/update' do
  @order = PizzaOrder.new(params)
  @order.update()
  erb(:update)
end
