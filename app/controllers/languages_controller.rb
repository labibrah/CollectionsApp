class LanguagesController < ApplicationController
  def switch_locale
    def switch_locale
      locale = params[:locale].to_sym
      I18n.locale = locale
      redirect_back fallback_location: root_path
    end
  end
end
