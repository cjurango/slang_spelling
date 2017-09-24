# Serializer for Exercise model
class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :started, :finished, :category
  belongs_to :word
  belongs_to :answer
end
