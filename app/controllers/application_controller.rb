class ApplicationController < ActionController::Base
  after_action :save_my_previous_url
  before_action :previous_url

  def save_my_previous_url
    session[:my_previous_url] = URI(request.referer || '').path
  end

  def previous_url
    @back_url = session[:my_previous_url]
  end
end
