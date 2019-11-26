set :branch, "install-gbg-bb"

server deploysecret(:server), user: deploysecret(:user), roles: %w[web app db importer cron]
