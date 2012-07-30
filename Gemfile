source 'https://rubygems.org'

gem 'rails', '3.2.7'
gem 'bootstrap-sass'
gem 'bcrypt-ruby'
gem 'will_paginate'
gem 'bootstrap-will_paginate'

gem 'grit'

group :development do
  gem 'growl'
end
group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'launchy'
  gem 'guard-rspec'
  # instead of not working metric_fu, without coverage
  gem 'metrical', :require => false 
  #gem 'ruby_parser', git: 'git://github.com/seattlerb/ruby_parser.git'
  gem 'fattr', :require => false 
  gem 'arrayfields', :require => false 
  gem 'map', :require => false 
  # also, manually include this pull request:
  # https://github.com/aselder/roodi/commit/a01982699867f8d994a2c1b5cd9fd865364f795f
  #simplecov
  gem 'simplecov', :require => false
  gem 'faker'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

group :test do
  gem 'capybara'
 # gem 'launchy' save_and_open_page does not work, #todo
  gem 'rb-fsevent', :require => false
  gem 'growl'
  gem 'guard-spork'
  gem 'spork'
  gem 'factory_girl_rails'
  gem 'cucumber-rails'
  gem 'database_cleaner'
end

group :production do
  gem 'pg'
end