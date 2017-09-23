# Exercise model
class Exercise < ActiveRecord::Base
  belongs_to :word
  belongs_to :answer
end
