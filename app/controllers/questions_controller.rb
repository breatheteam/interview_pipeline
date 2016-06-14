class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = current_user.questions
  end

  def new
    @question = Question.new
  end

  def create
    current_user.questions.create(question_param)
    redirect_to questions_path
  end

  private

  def question_param
    params.require(:question).permit(:content)
  end
end
