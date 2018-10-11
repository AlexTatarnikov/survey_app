source 'https://rubygems.org'

ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.1'
gem 'pg', '~> 1.0'
gem 'puma', '~> 3.12'
gem 'bootsnap', require: false

# Front-end Staff
gem 'webpacker', '~> 3.4'

# API Staff
gem 'responders'
gem 'fast_jsonapi'

# Authentication
gem 'bcrypt'
gem 'knock'

# API Documentation
gem 'apitome', git: 'https://github.com/jejacks0n/apitome.git', ref: '8fbf5aa'
gem 'rspec_api_documentation'

# ENV variables
gem 'dotenv-rails'

# Fake data
gem 'factory_bot_rails'
gem 'faker'

group :development, :test do
  gem 'rails_dt'
end

group :development do
  gem 'listen', '~> 3.0.5'
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'database_flusher'
  gem 'nyan-cat-formatter'
  gem 'simplecov', require: false
  gem 'webmock'
end

