class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_service, only: [:github]
  before_action :set_user, only: [:github]

  def github
    if !@service.present?
      uid, provider = user_info.dig(:uid), user_info.dig(:provider)
      @service = @user.connected_services.create!(provider: provider, uid: uid)
    end

    if user_signed_in?
      sign_in @user, event: :authentication
      redirect_to profile_path, notice: "Successfully connected your Github account."
    else
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Github") if is_navigational_format?
    end
  end

  def failure
    redirect_to new_user_session_path, alert: "Authentication failed."
  end

  private

  def user_info
    @user_info ||= request.env['omniauth.auth']
  end
  
  def set_service
    @service = ConnectedService.find_by(provider: user_info.dig(:provider), uid: user_info.dig(:uid))
  end

  ## Scenarios
  # 1. User is signed in
  # 2. User is not signed in but the service already exists
  # 3. The user is not signed in, the service does not exist and the email is taken
  # 4. The user is not signed in, the service does not exist and the email is not taken
  def set_user
    if current_user.present?
      @user = current_user
    elsif @service.present?
      @user = @service.user
    elsif User.find_by(email: user_info.dig(:info, :email)).present?
      @user = User.find_by(email: user_info.dig(:info, :email))
      flash[:alert] = "There's already an account using this e-mail address and a different sign-in method. Please use that to authenticate."
      redirect_to new_user_session_path
    else
      @user = create_user
    end
  end

  def create_user
    email = user_info.dig(:info, :email)
    username = user_info.dig(:info, :name) || user_info.dig(:info, :email).split('@').first
    User.create!(email: email, password: Devise.friendly_token[0, 20])
  end
end
