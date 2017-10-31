class WordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  def index
    if params[:term].present?
      @words = Word.search_by_word(params[:term]).order(id: :desc).page params[:page]
    elsif params[:photo_src]
      @words = Word.not_unsplash.order(id: :desc).page params[:page]
    else 
      @words = Word.order(id: :desc).page params[:page]
    end
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

  def word_params
    params.require(:word).permit(
      :word, 
      :image, 
      :grouping, 
      :pronunciation, 
      translations_attributes: [
        :id, 
        :foreign_word, 
        :foreign_pronunciation, 
        :photo, 
        :language_id, 
        :_destroy
      ]
    )
  end
end
