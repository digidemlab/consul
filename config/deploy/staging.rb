set :branch, "install-gbg-bb"

server deploysecret(:server1), user: deploysecret(:user), roles: %w[web app db importer cron background]