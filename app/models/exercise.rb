# Exercise model
class Exercise < ActiveRecord::Base
  validates :category, presence: true

  belongs_to :word
  belongs_to :answer

  def self.next_word
    max_id = Exercise.maximum(:word_id)
    if max_id.nil?
      Word.minimum(:id)
    else
      max_id + 1
    end
  end
end
