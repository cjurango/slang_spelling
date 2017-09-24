# Serializer for Answer model
class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :answer_word, :accurate
end
