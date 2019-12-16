get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end

post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)  

  if user && user.password == password
    "Success!"
  else
    "Login failed."
  end
end

get '/signup' do     # if a user navigates to the path "/signup",
  @user = User.new   # setup empty @user object
  erb(:signup)       # render "app/views/signup.erb"
end