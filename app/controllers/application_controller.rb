class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  private
  def not_authenticated
    redirect_to login_path, alert: "Сначала войдите в систему!"
  end

  def load_current_user
    @current_user = current_user
  end


end
