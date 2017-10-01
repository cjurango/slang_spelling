# Exercise model
class Exercise < ActiveRecord::Base
  belongs_to :word
  belongs_to :answer

  def self.next_word
    maxId = Exercise.maximum(:word_id)
    if maxId.nil?
      Word.minimum(:id)
    else
      maxId + 1
    end
  end
end
