class TranslationsController < ApplicationController
  before_action :set_translation, only: [:show, :edit, :update, :destroy]

  def index
    if params[:lang].present?
      @translations = Translation
        .includes(:language, :word)
        .where(languages: { tts_key: params[:lang] })
        .where('words.image LIKE ?', '%unsplash.com%')
        .references(:words)
        .order("RANDOM()").limit(5)
    else 
      @translations = Translation
        .includes(:language, :word)
        .where(languages: { tts_key: 'de-DE' })
        .where('words.image LIKE ?', '%unsplash.com%')
        .references(:words)
        .order("RANDOM()").limit(5)
    end
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

    respond_to do |format|
      if @translation.save
        format.html { redirect_to @translation, notice: 'Translation was successfully created.' }
        format.json { render :show, status: :created, location: @translation }
      else
        format.html { render :new }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @translation.update(translation_params)
        format.html { redirect_to @translation, notice: 'Translation was successfully updated.' }
        format.json { render :show, status: :ok, location: @translation }
      else
        format.html { render :edit }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @translation.destroy
    respond_to do |format|
      format.html { redirect_to translations_url, notice: 'Translation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_translation
      @translation = Translation.find(params[:id])
    end

    def translation_params
      params.require(:translation).permit(:foreign_word, :foreign_pronunciation, :word_id, :language_id)
    end
end
