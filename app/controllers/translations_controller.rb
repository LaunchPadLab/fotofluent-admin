class TranslationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_translation, only: [:show, :edit, :update, :destroy]

  def index
    @translations = translation_service.filtered_translations
  end

  def show
  end

  def new
    @translation = Translation.new
  end

  def edit
  end

  def create
    @translation = Translation.new(translation_params)

    if @translation.save
      redirect_to @translation, notice: 'Translation was successfully created.'
    else
      render :new
    end
  end

  def update
    if @translation.update(translation_params)
      redirect_to @translation, notice: 'Translation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @translation.destroy
    redirect_to translations_url, notice: 'Translation was successfully destroyed.'
  end

  private

  def set_translation
    @translation = Translation.find(params[:id])
  end

  def translation_service
    @translation_service ||= TranslationService.new(translation_service_params)
  end

  def translation_service_params
    @translation_service_params ||= TranslationServiceDecanter.decant(params)
  end

  def translation_params
    params.require(:translation).permit(:foreign_word, :foreign_pronunciation, :word_id, :language_id)
  end
end
