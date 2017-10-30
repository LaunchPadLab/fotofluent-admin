class TranslationService
  attr_reader :language_code, :grouping, :limit

  def initialize(args={})
    @language_code = args.fetch(:lang, 'de-DE')
    @grouping = args.fetch(:grouping, nil)
    @limit = args.fetch(:limit, 1)
  end

  def translations
    Translation
      .from_unsplash
      .for_language(language_code)
      .for_grouping(grouping)
      .order("RANDOM()")
      .limit(limit)
  end
end

