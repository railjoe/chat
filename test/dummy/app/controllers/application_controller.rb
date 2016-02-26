class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  acts_as_token_authentication_handler_for User, fallback_to_devise: false

  private

  # Override this method in order to get the current user using only the auth token
  def find_record_from_identifier(entity)
    model = entity.model
    user_token = request.headers["X-#{model.to_s.upcase}-TOKEN"]
    super if model != User || user_token.blank?
    model.find_by authentication_token: user_token
  end
end
