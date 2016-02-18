# encoding: utf-8

include Warden::Test::Helpers

module RequestHelpers
  def login(user)
    model = user.class.name.upcase
    request.headers["X-#{model}-TOKEN"] = user.authentication_token
    request.headers["X-#{model}-EMAIL"] = user.email
  end
end
