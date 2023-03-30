source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"

# gem "bcrypt", "~> 3.1.7"
# gem "image_processing", "~> 1.2"
gem "bootsnap", require: false
gem "cssbundling-rails"
gem "devise"
gem "jbuilder"
gem "jsbundling-rails"
gem "pg", "~> 1.1"
gem "propshaft"
gem "puma", "~> 5.0"
gem "redis", "~> 4.0"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-rails"
  gem "pry-rescue"
  gem "rspec-rails", "~> 6.0.0"
end

group :development do
  gem "better_errors"
  gem "hotwire-livereload"
  gem "letter_opener"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "selenium-webdriver"
end
