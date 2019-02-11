# config valid only for current version of Capistrano
lock "3.9.0"

set :application, 'b-home'
set :repo_url, 'git@github.com:baukevw/b-home.git'

set :rvm_ruby_version, '2.6.1'
set :passenger_restart_with_touch, true
set :pty, true

set :linked_files, %w{config/master.key}

append :linked_files, '.env'
append :linked_dirs, 'log', 'tmp', 'public/system', 'public/uploads'
