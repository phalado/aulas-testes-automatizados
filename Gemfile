source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.3'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.2', '>= 5.2.2'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4'
gem 'devise', '~> 4.7', '>= 4.7.3'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.17'
  gem 'rspec-rails'
  gem 'rubocop', '~> 1.9'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3'
end

group :test do
  gem 'capybara', '~> 2.7', '>= 2.7.1'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'shoulda-callback-matchers', '~> 1.1.4'
  gem 'simplecov', '~> 0.21.2'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
