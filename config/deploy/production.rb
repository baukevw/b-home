server '213.10.240.190:22', user: 'deploy', roles: %w{web app db}

set :deploy_to, '/var/www/b_home/production'

set :rails_env, 'production'
set :branch, 'feature/thermostat_device'
