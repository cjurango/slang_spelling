# Exercise model
class Exercise < ActiveRecord::Base
  belongs_to :word
  belongs_to :answer

  def self.next_word
    Exercise.maximum(:word_id) + 1
  end
end
