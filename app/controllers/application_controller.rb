class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :not_authroized

  private
    def not_authroized
      redirect_to root_path, alert: 'You aren\'t allowed to access this.'
    end
end
