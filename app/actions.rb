get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end

post '/login' do
  username = params[:username]
  password = params[:password]

  @user = User.find_by(username: username)  

  if @user && @user.password == password
    session[:user_id] = @user.id
    "Success! User with id #{session[:user_id]} is logged in!"
  else
    @error_message = "Login failed."
    erb(:login)
  end
end

get '/login' do    # when a GET request comes into /login
  erb(:login)      # render app/views/login.erb
end

get '/logout' do
  session[:user_id] = nil
  "Logout successful!"
end

post '/signup' do

  # grab user input values from params
  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]

  # instantiate and save a User
  user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
  user.save

  # return readable representation of User object
  escape_html user.inspect
end

get '/signup' do     # if a user navigates to the path "/signup",
  @user = User.new   # setup empty @user object
  erb(:signup)       # render "app/views/signup.erb"
end

get '/finstagram_posts/new' do
  @finstagram_post = FinstagramPost.new
  erb(:"finstagram_posts/new")
end

post '/finstagram_posts' do
  photo_url = params[:photo_url]

  @finstagram_post = FinstagramPost.new({ photo_url: photo_url, user_id: current_user.id })

  if @finstagram_post.save
    redirect(to('/'))
  else
    erb(:"finstagram_posts/new")
  end
end