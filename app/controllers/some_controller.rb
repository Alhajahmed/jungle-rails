class SomeController < ApplicationController
  before_action :require_login, only: [:restricted_action]

  def restricted_action
    # This action is only accessible to logged-in users
  end

  private

  def require_login
    unless session[:user_id]
      flash[:alert] = "You must be logged in to access this page"
      redirect_to new_session_path
    end
  end
end
