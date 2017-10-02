# Answer model
class Answer < ActiveRecord::Base
  validates :answer_word, presence: true
  validates :accurate, presence: true

  has_one :exercise
end
