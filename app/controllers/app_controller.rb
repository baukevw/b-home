class AppController < ApplicationController
  layout 'app'
  before_action :authenticate_user!
  add_breadcrumb "Dashboard", :dashboard_path
end
