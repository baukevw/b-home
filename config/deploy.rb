# config valid only for current version of Capistrano
lock "3.9.0"

set :application, 'b-home'
set :repo_url, 'git@github.com:baukevw/b-home.git'

set :rbenv_ruby, '2.4.1'
set :rbenv_custom_path, '/home/deploy/.rbenv/'

set :passenger_restart_with_touch, true
set :pty, true

set :linked_files, %w{config/master.key}

append :linked_files, '.env'
append :linked_dirs, 'log', 'tmp', 'public/system', 'public/uploads'
