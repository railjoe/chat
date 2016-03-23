# encoding: utf-8

module Api
  module V1
    class ApiController < ApplicationController

      private

      # Override this method in order to get the current user using only the auth token
      def find_record_from_identifier(entity)
        model = entity.model
        user_token = request.headers["X-#{model.to_s.upcase}-TOKEN"]
        super if model != User || user_token.blank?
        model.find_by authentication_token: user_token
      end
    end
  end
end
