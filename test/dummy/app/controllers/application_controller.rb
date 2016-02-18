class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # Override this method in order to get the current user using only the auth token
  def find_record_from_identifier(entity)
    model = entity.model
    user_token = request.headers["X-#{model.to_s.upcase}-TOKEN"]
    super if model != Stylist && model != Client || user_token.blank?
    model.find_by authentication_token: user_token
  end
end
