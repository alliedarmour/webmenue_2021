source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails"
# Use postgresql as the database for Active Record
gem "pg"
# Use Puma as the app server
gem "puma"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder"
# Use Redis adapter to run Action Cable in production
gem "redis"
# Use Active Model has_secure_password
gem "bcrypt"

# Use Active Storage variant
# gem "image_processing", "~> 1.2"

gem "bootsnap", require: false

group :development, :test do
  gem "byebug"
  gem "capybara"
  gem "active_decorator-rspec"
  gem "dotenv-rails"
  gem "rspec-rails"
  gem "solargraph"
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "rack-mini-profiler"
  gem "listen"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# I18n for localization
gem "rails-i18n"

# Stimulus + Stimulus Reflex + CableReady + TurboJS + ViewComponents
gem "stimulus_reflex"
gem "cable_ready"
gem "turbo-rails"
gem "view_component", require: "view_component/engine"
gem "omniauth-identity"
gem "rolify"

# Decorator to not pollute models
gem "active_decorator"

# Charting and Grouping libraries
gem "chartkick"
gem "groupdate"

# Pagination
gem "pagy"

# QR-Code library
gem "rqrcode"

# PDF Generation
gem "grover"

# Seeding fake data
gem "faker"
