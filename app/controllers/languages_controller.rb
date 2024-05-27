class LanguagesController < ApplicationController
  def switch_locale
    locale = params[:locale]
    if I18n.available_locales.map(&:to_s).include?(locale)
      I18n.locale = locale
      session[:locale] = locale
    end
    redirect_back(fallback_location: root_path)
  end
end
