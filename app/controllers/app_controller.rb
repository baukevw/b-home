class AppController < ApplicationController
  layout 'app'
  before_action :authenticate_user!
end
