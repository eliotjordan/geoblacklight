cp -R /project/workspace/. /project/geoblacklight
chown -R vscode:vscode /project/geoblacklight
su vscode -c "bundle install || true && bundle exec rake geoblacklight:server"
