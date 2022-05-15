module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    before_action :authenticate_user!

    helper_method :current_user
    helper_method :user_signed_in?
  end

  def login user
    reset_session
    session[:current_user_id] = user.id
  end

  def logout
    reset_session
  end

  def authenticate_user!
    redirect_to new_session_path, alert: "You need to login to access that page." unless user_signed_in?
  end

  def redirect_if_authenticated
    redirect_to root_path, alert: "You are already logged in." if user_signed_in?
  end

  private

  def current_user
    User.current ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  def user_signed_in?
    User.current.present?
  end
end
