require 'test_helper'

class Api::V1::ExercisesControllerTest < ActionController::TestCase
  test 'should get progress' do
    get :progress
    assert_response :success
    assert_equal '{"progress":0}', @response.body
  end

  test 'should get exercise' do
    get :show, id: 1
    assert_response :success
    assert_equal '{"id":1,'\
      '"started":false,'\
      '"finished":false,'\
      '"category":"spelling",'\
      '"word":null,'\
      '"answer":null}', @response.body
  end

  test 'should not get invalid exercise id' do
    get :show, id: 4
    assert_response :missing
    assert_equal '{"message":"Not Found","status":404}', @response.body
  end

  test 'should post exercise' do
    post :create
    assert_response :success
    assert_equal '{"id":3,'\
      '"started":false,'\
      '"finished":false,'\
      '"category":"spelling",'\
      '"word":{"id":1,'\
        '"complete_word":"test",'\
        '"letter_pool":["t","e","s","t"]'\
      '},'\
      '"answer":null}', @response.body
  end

  test 'should not put invalid exercise id' do
    put :update, { finished: true, answer: { answer_word: 'test', accurate: true }, id: 4 }
    assert_response :missing
    assert_equal '{"message":"Not Found","status":404}', @response.body
  end

  test 'should put exercise' do
    put :update, { finished: true, answer: { answer_word: 'test', accurate: true }, id: 2 }
    assert_response :success
    assert_equal '{"id":2,'\
      '"started":false,'\
      '"finished":true,'\
      '"category":"spelling",'\
      '"word":null,'\
      '"answer":{"id":3,'\
        '"answer_word":"test",'\
        '"accurate":true'\
      '}}', @response.body
  end
end
