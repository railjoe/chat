source 'https://rubygems.org'

# Declare your gem's dependencies in chat.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

group :development, :test do
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'faker', '~> 1.4.3'
  gem 'rspec-rails', '~> 3.3.2'
  gem 'spork-rails', '~> 4.0.0'
  gem 'thin', '~> 1.6.3'
end

group :test do
  gem 'database_cleaner', '~> 1.4.1'
  gem 'shoulda-matchers', '~> 2.8.0'
end

gem 'annotate', '~> 2.6.5'
gem 'jbuilder', '~> 1.2'
