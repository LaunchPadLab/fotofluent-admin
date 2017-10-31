class TranslationService
  attr_reader :language_code, :grouping, :limit

  DEFAULT_LANGUAGE = 'de-DE'
  DEFAULT_LIMIT = 1
  DEFAULT_GROUPING = nil

  def initialize(args={})
    @language_code = args.fetch(:language_code, DEFAULT_LANGUAGE)
    @grouping = args.fetch(:grouping, DEFAULT_GROUPING)
    @limit = args.fetch(:limit, DEFAULT_LIMIT)
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

