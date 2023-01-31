class ApplicationController < ActionController::Base
  # before_action :current_user
  # @current_user ||= User.find_by(id: session[:user_id])
  def current_user
    User.first
  end
end
