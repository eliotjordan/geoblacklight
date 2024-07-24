FROM mcr.microsoft.com/devcontainers/ruby:1-3.3-bullseye

# Install Rails
RUN su vscode -c "gem install rails webdrivers"
RUN su vscode -c "/usr/local/rvm/bin/rvm fix-permissions"

# Default value to allow debug server to serve content over GitHub Codespace's port forwarding service
# The value is a comma-separated list of allowed domains 
ENV RAILS_DEVELOPMENT_HOSTS=".githubpreview.dev,.preview.app.github.dev,.app.github.dev,.csb.app"

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash
RUN apt-get update && apt-get install nsolid openjdk-11-jre-headless -y

COPY init.sh /init.sh

WORKDIR /project/gbl-app
EXPOSE 3000
