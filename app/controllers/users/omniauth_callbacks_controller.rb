class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def mapmyfitness
    p "8" * 1000
    p request.env["omniauth.auth"]
    p "8" * 1000

    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Map My Fitness") if is_navigational_format?
    else
      session["devise.mapmyfitness_data"] = request.env["omniauth.auth"]["token"]
      redirect_to new_user_registration_url
    end
  end
end