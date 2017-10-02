require 'test_helper'

class ExersiceTest < ActiveSupport::TestCase

  test 'can be initialized' do
    exercise = Exercise.new
    assert_instance_of Exercise, exercise
  end

  test 'get the next word id' do
    assert_equal Exercise.next_word, 1
  end

end
