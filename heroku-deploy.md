# Deploying Finstagram to Heroku
These instructions will help you deploy your Finstagram app to Heroku (a web hosting service), so that the entire internet will be able to see and interact with your application! Before we get to deployment though, we need to make sure a couple of our files are setup properly.

## Pre-Deployment: Edit Your Gemfile
Ensure your `Gemfile` file contains the following code (should match exactly).
```ruby
source "https://rubygems.org"

gem 'rake'
gem 'activesupport'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-activerecord'

gem 'puma'
gem 'tux'
gem 'pry'

group :development, :test do
  gem 'shotgun'
  gem 'sqlite3'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
end
```

## Pre-Deployment: Edit Your Database File
Ensure your `config/database.db` file contains the following codes (should match exactly).
```ruby
configure do
  # Log queries to STDOUT in development
 if Sinatra::Application.development?
    set :database, {
      adapter: "sqlite3",
      database: "db/db.sqlite3"
    }
  else
    db = URI.parse(ENV['DATABASE_URL'])
    set :database, {
      adapter: "postgresql",
      host: db.host,
      username: db.user,
      password: db.password,
      database: db.path[1..-1],
      encoding: "utf8"
    }
  end

  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
```

## Deploying Finstagram to Heroku
**1.** Create an account at [heroku.com](https://heroku.com).
 * Write down/make sure you remember your username and password!
 * Heroku will ask you to confirm your email (which you have to do before your account is active/usable).

**2.** Go back to Cloud9, and in a `bash` tab, type the following and hit enter:
 * `heroku login`
 * Next, you will be prompted to enter the email you entered for your _Heroku_ account, along with the password (the cursor _will not move_ when you enter your password). When you're done typing your password, hit enter.
 * If it worked, it will say something like `Logged in as you@youremail.com`
 * Next, still in your bash tab, run this: `heroku create`
 * Write down the URL that it spits out- this will be how you'll access your application once it's deployed! The URL should look like `https://stark-reef-21398.herokuapp.com/`

**3.** Still in your `bash` tab, run the command `heroku addons:create heroku-postgresql:hobby-dev`
 * Then run `bundle install`

**4.** Still in the bash tab, save your code using git:
 * a) `git status`
 * b) `git add .`
 * c) `git commit -m "Readies app for deployment"`

**5.** Still in the bash tab, launch your app by typing: `git push heroku`

**6.** Lastly, still in the bash tab, create the database: `heroku run bundle exec rake db:migrate`

## Seeing Your Live App!
Remember the URL you wrote down after you did `heroku create`? Yep, now is the time to get out that link and try visiting it in your browser! If you did everything correctly, it should load your Finstagram app :)

## Making Changes
Once your app is live, you can still make changes to your code and add new features! You can make your changes in Cloud9 as you would normally, then once you're done, make sure all your changes are saved.

**1.** Open a bash tab, and save your changes with Git:
 * a) `git status`
 * b) `git add .`
 * c) `git commit -m "Description of your changes."`

**2.** Still in the bash tab, push your changes to Heroku: `git push heroku`

**3.** Go back to your Heroku app, refresh the page, and your changes will be there!

## Using Tux on Heroku

When developing your app on Cloud9, you were able to do `bundle exec tux` to edit things in your database and just generally play around with ruby code. Once your app is deployed to Heroku, using tux won't change things on the Heroku version of your app, it'll only change them on Cloud9.

To make changes to things in the database of your Heroku app, you should go into Cloud9, open a new `bash` tab, and then run this command:

```
heroku run bundle exec tux
```

_(and then you can use tux as you normally would)_

## Links & References
* https://devcenter.heroku.com/articles/rack
* https://devcenter.heroku.com/articles/git
* https://devcenter.heroku.com/categories/heroku-postgres
* http://www.sinatrarb.com/documentation.html
