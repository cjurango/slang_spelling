# Serializer for Word model
class WordSerializer < ActiveModel::Serializer
  attributes :id, :complete_word, :letter_pool
end
