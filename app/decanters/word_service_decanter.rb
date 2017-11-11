class WordServiceDecanter < Decanter::Base
  strict true
  input :search_term, :string
  input :photo_src, :string
  input :page, :integer
end
