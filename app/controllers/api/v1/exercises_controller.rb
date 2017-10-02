# Actions for exercise resource
class Api::V1::ExercisesController < ApplicationController
  before_action :fetch_exercise, only: %i[show update]
  respond_to :json

  def progress
    answers = Exercise.joins(:answer)
    num_answers = answers.count
    num_accu_answers = answers.where('answers.accurate' => 'true').count
    progress = (num_accu_answers.to_f * 100) / (num_answers.to_f.nonzero? || 1)
    render json: { progress: progress.ceil }
  end

  def show
    if @exercise
      render json: @exercise, include: %w[word answer],
             serializer: ExerciseSerializer
    else
      render json: error('Not Found', 404), status: 404
    end
  end

  def create
    @exercise = Exercise.new
    @word = Word.find(Exercise.next_word)
    @exercise.word = @word
    if @exercise.save
      render json: @exercise,
             serializer: ExerciseSerializer,
             meta: { status: 201, message: '201 Created', location: @exercise },
             status: 201
    else
      render json: error('Internal Error', 500), status: 500
    end
  end

  def update
    if @exercise
      answer = exercise_params[:answer] ? define_answer : @exercise.answer
      @exercise.answer = answer
      if @exercise.update(finished: exercise_params[:finished])
        render json: @exercise, serializer: ExerciseSerializer
      else
        render json: error('Internal Error', 500), status: 500
      end
    else
      render json: error('Not Found', 404), status: 404
    end
  end

  private

  def define_answer
    if @exercise.answer
      @answer = Answer.find(@exercise.answer)
      @answer.update(exercise_params[:answer])
    else
      @answer = Answer.new(exercise_params[:answer])
      @answer.save
    end
    @answer
  end

  def fetch_exercise
    @exercise = Exercise.where(id: params[:id]).first
  end

  def exercise_params
    params.permit(:started, :finished, :id, answer: %i[answer_word accurate])
  end

  def error(msg, status)
    {
      message: msg,
      status: status
    }
  end
end
