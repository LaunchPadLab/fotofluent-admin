class WordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  def index
    @words = word_service.filtered_words
  end

  def show
  end

  def new
    @word = Word.new
  end

  def edit
  end

  def create
    @word = Word.new(word_params)

    if @word.save
      redirect_to @word, notice: 'Word was successfully created.'
    else
      render :new
    end
  end

  def update
    if @word.update(word_params)
      redirect_to @word, notice: 'Word was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @word.destroy
    redirect_to words_url, notice: 'Word was successfully destroyed.'
  end

  private

  def set_word
    @word = Word.find(params[:id])
  end

  def word_service
    @word_service ||= WordService.new(word_service_params)
  end

  def word_service_params
    @word_service_params ||= WordServiceDecanter.decant(params)
  end

  def word_params
    params.require(:word).permit(
      :word, 
      :image, 
      :photo,
      :grouping, 
      :pronunciation, 
      translations_attributes: [
        :id, 
        :foreign_word, 
        :foreign_pronunciation, 
        :language_id, 
        :_destroy
      ]
    )
  end
end
