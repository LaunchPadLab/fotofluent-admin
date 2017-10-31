class WordService
  attr_reader :search_term, :photo_src, :page

  def initialize(args={})
    @search_term = args.fetch(:search_term, nil)
    @photo_src = args.fetch(:photo_src, nil)
    @page = args.fetch(:page, nil)
  end

  def filtered_words
    return search_filtered if search_term
    return photo_src_filtered if photo_src
    default_words
  end

  private

  def search_filtered
    Word
      .search_by_word(search_term)
      .order(id: :desc)
      .page(page)
  end

  def photo_src_filtered
    Word
      .not_unsplash
      .order(id: :desc)
      .page(page)
  end

  def default_words
    Word.order(id: :desc).page(page)
  end
end