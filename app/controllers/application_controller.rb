class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_owner!
    @link = Link.find(params[:id])
    unless current_user.id == @link.user_id
      redirect_to '/'
    end
  end
end
