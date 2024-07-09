# frozen_string_literal: true

gem "blacklight", "~> 7.0"

if ENV["BRANCH"]
  gem "geoblacklight", github: "eliotjordan/geoblacklight", branch: ENV["BRANCH"]
else
  gem "geoblacklight", "~> 4.0"
end

run "bundle install"

generate "blacklight:install", "--devise"
generate "geoblacklight:install", "-f"

rake "db:migrate"
