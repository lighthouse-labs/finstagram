get '/' do

    @finstagram_posts = FinstagramPost.order(created_at: :desc)
    erb(:index)

end

get '/signup' do   #if a user navigates to the path

    @user = User.new  #setup empty @user object
    erb(:signup)  #render "pp/views/signup.erb"

end


post '/signup' do
    # "Form submitted!"

#params.to_s

#grab user input values
email = params[:email]
avatar_url = params[:avatar_url]
username = params[:username]
password = params[:password]

#instntiate and save a User

if email.present? && avatar_url.present? && username.present? && password.present?

#instantiate and save a user    
    user = User.new({email: email, avatar_url:avatar_url, username: username, password: password})
    user.save

#return readable representation of user objectc
escape_html user.inspect

else

#display simple error
"Validation failed"    
end
end
