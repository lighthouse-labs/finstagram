# home
get '/' do
  @posts = Post.order 'created_at DESC'
  erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do
  session[:email] = params[:email]
  erb session[:email]
end
