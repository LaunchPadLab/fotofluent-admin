class LowercaseParser < Decanter::Parser::ValueParser
  pre :string

  parser do |value, options|
    value.downcase
  end
end
