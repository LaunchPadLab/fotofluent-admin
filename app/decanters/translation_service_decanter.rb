class TranslationServiceDecanter < Decanter::Base
  strict true
  input :language_code, :string
  input :lang, :string
  input :grouping, :lowercase
end
