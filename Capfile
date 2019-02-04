# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Include tasks from other gems included in your Gemfile
require "capistrano/rbenv"
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/env-config'
require 'capistrano/rails/migrations'
require 'capistrano/passenger'
require "capistrano/webpacker/precompile"

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
