class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def azure_activedirectory_v2
    response_params = request.env['omniauth.auth']['info']
    email = response_params['email']
    uid = request.env['omniauth.auth']['uid']
    provider = request.env['omniauth.auth']['provider']

    @user = User.find_by(email: email)

    if @user
      # If user is already signed in, redirect to the home page or some other page
      if user_signed_in?
        redirect_to root_path
      else
        # If user is not signed in, sign in the user and redirect to the home page or some other page
        sign_in(@user)
        redirect_to root_path
      end
    else
      # If user is not found, redirect to the sign-up page
      redirect_to new_user_registration_url
    end
  end
end
