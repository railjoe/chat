module Chat
  class ApplicationController < ActionController::Base
    def current_user
      send(Chat.method_current_user)
    end
  end
end
