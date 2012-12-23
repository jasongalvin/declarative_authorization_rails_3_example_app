source 'https://rubygems.org'
gem 'rails', '3.2.9'
gem 'sqlite3'
gem 'thin'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "haml-rails", ">= 0.3.5", :group => :development
  gem "hpricot", ">= 0.8.6", :group => :development
  gem "ruby_parser", ">= 3.1.0", :group => :development
  gem "hub", ">= 1.10.2", :require => nil, :group => [:development]
end

group :test do
  gem "capybara", ">= 2.0.1", :group => :test
  gem "database_cleaner", ">= 0.9.1", :group => :test
  gem "email_spec", ">= 1.4.0", :group => :test
end

group :development, :test do
  gem "rspec-rails", ">= 2.11.4", :group => [:development, :test]
  gem "factory_girl_rails", ">= 4.1.0", :group => [:development, :test]
  gem "debugger"
end

gem 'jquery-rails'
gem "haml", ">= 3.1.7"
gem "bootstrap-sass", ">= 2.1.1.0"
gem "devise", ">= 2.1.2"
gem "figaro", ">= 0.5.0"
gem "declarative_authorization"
