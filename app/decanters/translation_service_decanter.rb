class TranslationServiceDecanter < Decanter::Base
  strict true
  input :language_code, :string
  input :limit, :integer
  input :grouping, :lowercase
end
