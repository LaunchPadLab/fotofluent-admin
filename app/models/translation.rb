class Translation < ApplicationRecord
  belongs_to :word
  belongs_to :language
end
