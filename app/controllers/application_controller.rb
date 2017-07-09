class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user!              # if not signed in, tell them to sign in.
    if !user_signed_in?
      redirect_to new_session_path, notice: 'Please log in!'
    end
  end

  def user_signed_in?
    session[:user_id].present?         #checks if the user id is present. So if the person is signed in.
  end

  #👇 makes the method 👆 available to all my views
  helper_method :user_signed_in?

  def current_user
    #find by will just return nill if no one signed in.
    # So we see who signed in.
    @current_user ||= User.find_by(id: session[:user_id]) if user_signed_in?
  end

  helper_method :current_user #, :user_signed_in

  def authorize_organizer
    head :unauthorized unless current_user.user_events.is_organizer? 
  end
end
