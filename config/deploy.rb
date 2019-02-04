# config valid only for current version of Capistrano
lock "3.9.0"

set :application, 'b-home'
set :repo_url, 'git@github.com:baukevw/b-home.git'

set :rbenv_ruby, '2.4.1'
set :rbenv_custom_path, '/home/deploy/.rbenv/'

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

set :passenger_restart_with_touch, true
set :pty, true

set :linked_files, %w{config/master.key}

append :linked_files, '.env'
append :linked_dirs, 'log', 'tmp', 'public/system', 'public/uploads'

after 'deploy:updated', 'webpacker:precompile'
