# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.3.4
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

# Rails app lives here
WORKDIR /rails

# Set production environment
ENV RAILS_ENV="development"

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git pkg-config nodejs npm curl libsqlite3-0

RUN npm install --global yarn

# Run and own only the runtime files as a non-root user for security
RUN useradd rails --create-home --shell /bin/bash

# Install gems and javascript packages
COPY Gemfile .
COPY package.json .
RUN chown -R rails:rails /rails
USER rails:rails
RUN yarn install
RUN bundle install

# Add application code
USER root
COPY . .
RUN chown -R rails:rails /rails
USER rails:rails

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]
