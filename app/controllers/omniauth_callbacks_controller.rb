class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def sign_in_with(provider_name)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => provider_name) if is_navigational_format?
    else
      session["devise.#{provider_name}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  def twitter
    sign_in_with "Twitter"
  end

  def google_oauth2
    sign_in_with "Google"
  end

  def developer
    sign_in_with "Developer"
  end

  def failure
    redirect_to root_path
  end

end

