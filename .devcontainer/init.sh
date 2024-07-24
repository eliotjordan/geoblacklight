 /project/geoblacklight/. /project/workspace
 chown -R vscode:vscode /project/workspace
 su vscode -c "bundle install || true && bundle exec rake geoblacklight:server"
