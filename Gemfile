source "https://rubygems.org"

gem "rails", "~> 8.0.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jsbundling-rails"
gem "turbo-rails", github: "hotwired/turbo-rails", branch: "main"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  gem "ffaker"

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "annotaterb"
  gem "web-console"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

gem "avo", ">= 3.2"
gem "aws-sdk-s3"
gem "commonmarker"
gem "devise", "~> 4.9"
gem "figaro", git: "https://github.com/laserlemon/figaro"
gem "friendly_id"
gem "inline_svg"
gem "marksmith"
gem "omniauth"
gem "omniauth-github"
gem "omniauth-google-oauth2"
gem "omniauth-rails_csrf_protection"
gem "pagy"
gem "ransack"
gem "schema_dot_org", git: "https://github.com/erozas/schema-dot-org"
gem "sitemap_generator"
gem "whenever", require: false