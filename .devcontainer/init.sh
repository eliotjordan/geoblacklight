cp -R /project/workspace/. /project/gbl-app
chown -R vscode:vscode /project/gbl-app
cd /project/gbl-app
git config --global --add safe.directory /project/gbl-app
su vscode -c "bundle install || true && bundle exec rake geoblacklight:server"
