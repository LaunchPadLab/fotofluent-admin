class Api::V1::TranslationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    json_with translation_service.filtered_translations
  end

  private

  def translation_service_params
    @translation_service_params ||= TranslationServiceDecanter.decant(params)
  end

  def translation_service
    TranslationService.new(translation_service_params)
  end
end
