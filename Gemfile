source 'https://rubygems.org'
ruby '2.2.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
end

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap'
gem 'octicons-rails'
gem 'figaro'
gem 'pry'
gem 'devise'

group :development, :test do
  gem 'spring' # Pre Loads web server in Dev for faster response times
  gem 'pry-rails' # Pry REPL for rails. 
  gem 'pry-byebug' # Byebug debbuging methods in PRY
  gem 'rspec-rails' # RSpec for Rails
  gem 'capybara'
  gem 'shoulda'
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'better_errors'
  gem 'binding_of_caller'
end