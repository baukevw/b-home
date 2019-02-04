server '213.10.240.190:22', user: 'deploy', roles: %w{web app db}

set :deploy_to, '/home/deploy/rails/b-home/production'

set :rails_env, 'production'
set :branch, 'develop'
