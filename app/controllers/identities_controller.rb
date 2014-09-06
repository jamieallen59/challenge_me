class IdentitiesController < ApplicationController
  def create
    if user_signed_in?
      current_user.identities.where(user_id: current_user.id, provider: auth_hash['provider'], uid: auth_hash['uid']).inspect
      @user = current_user.identities.where(user_id: current_user.id, provider: auth_hash['provider'], uid: auth_hash['uid']).first_or_initialize.update_attributes(provider: auth_hash['provider'], uid: auth_hash['uid'], token: auth_hash['credentials']['token'], secret: auth_hash['credentials']['secret'])
      flash[:notice] = 'Linked to map my fitness'
      redirect_to '/'
    else
      flash[:alert] = 'You need to be logged in'
      redirect_to new_user_session_path
    end
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end