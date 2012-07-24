source 'https://rubygems.org'

gem 'rails'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-rspec'
  # metric_fu with various "workarounds"
#  gem 'metric_fu'
#  gem 'rcov', '0.9.11'
  gem 'fattr'
  gem 'arrayfields'
  gem 'metrical', :require => false # supposedly should take care of dependencies, but doesn't
  gem 'map'
  #simplecov
  gem 'simplecov', :require => false
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
  gem 'rb-fsevent', :require => false
  gem 'growl'
  gem 'guard-spork'
  gem 'spork'
end

group :production do
  gem 'pg'
end