class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token, if: :devise_controller? && :destroy_user_session_path

    def toggle_dark_mode
        puts 'Helloooooo'
        dark_mode = current_user.darkMode == 'true' ? 'false' : 'true'
        current_user.update(darkMode: dark_mode)
        session[:dark_mode] = dark_mode
        head :no_content
      end
end
