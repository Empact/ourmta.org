source 'https://rubygems.org'

ruby '2.5.1'

gem 'rails', '5.2.1'

gem 'rest-client'
gem 'json'
gem 'jquery-rails'
gem 'puma'
gem 'rack-timeout', require: 'rack/timeout/base'

group :assets do
  gem 'uglifier',     '>= 1.0.3'
  gem 'yui-compressor'
end

group :test, :development do
  gem 'rspec-rails'
end

group :production do
  gem 'rails_12factor'
end
