class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from Mongoid::Errors::DocumentNotFound, with: :record_not_found

  private

  def record_not_found
    flash[:error] = I18n.t('messages.errors.not_found')
    redirect_back(fallback_location: root_path)
  end
end
