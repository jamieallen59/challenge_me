class SessionsController < ApplicationController
  def create
    # @user = User.find_by(email: auth_hash.info['email'])
    # sign_in_and_redirect @user, :event => :authentication
    render json: auth_hash
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
