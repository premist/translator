# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'

# Enhanced interactive shell
gem 'pry-rails', '~> 0.3.6'

# Google Cloud Translation API
gem 'google-cloud-translate', '~> 1.0'

group :development, :test do
  gem 'dotenv-rails', '~> 2.2.1'
  gem 'rspec-rails', '~> 3.6'
  gem 'rubocop', '~> 0.49.1', require: false
end

group :development do
  # Access an IRB console on exception pages or by using
  # <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
