class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    question = current_user.questions.find(params[:question_id])
    answer = question.answers.create(answer_params)
    redirect_to edit_company_path(answer.company)
  end

  def update
    answer = current_user.answers.find(params[:id])
    answer.update(answer_params)
    redirect_to edit_company_path(answer.company)
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :company_id)
  end
end
