class IdentitiesController < ApplicationController
  def create
    @user = current_user.identities.find_or_create_by(provider: auth_hash['provider'], uid: auth_hash['uid'], token: auth_hash['credentials']['token'])
    flash[:notice] = 'Linked to map my fitness'
    redirect_to '/'
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
