source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem 'bourbon'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'devise'          # https://github.com/plataformatec/devise
gem 'api_docs'        # https://github.com/twg/api_docs
gem 'versionist'
gem 'rabl'
gem 'oj'
gem 'nokogiri'
gem 'kaminari'
gem 'jquery-datatables-rails'#, github: 'rweng/jquery-datatables-rails'
gem 'jquery-ui-rails'
gem 'paperclip'
gem 'cocaine', '0.5.3'  # Required for paperclip

group :development do
  gem "better_errors"
  gem "binding_of_caller"
end

group :test, :development do
  gem 'rspec-rails', "~> 2.14"
end

group :test do
  gem 'capybara', "2.1.0"
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
group :production do
  gem 'unicorn'
  gem 'mysql2'
end

# Use Capistrano for deployment
gem 'capistrano', group: :development
gem 'capistrano-rails'
gem 'capistrano-rvm'
gem 'capistrano-bundler'

# Use debugger
# gem 'debugger', group: [:development, :test]