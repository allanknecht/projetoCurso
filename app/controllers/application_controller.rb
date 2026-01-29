class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

  def require_same_user
    resource = @article || @user
    owner = resource.respond_to?(:user) ? resource.user : resource

    if current_user != owner
      flash[:alert] = "You can only edit your own content"
      redirect_to resource.respond_to?(:user) ? articles_path : resource
    end
  end
end
