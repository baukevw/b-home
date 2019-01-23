class AppController < ApplicationController
  layout 'app'
  before_action :authenticate_user!
  add_breadcrumb "Dashboard", :root_path
end
