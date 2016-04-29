class QuestionsController < ApplicationController

	def index

	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.create(question_params)
		redirect_to questions_path
	end

	private

	def question_params
		params.require(:question).permit(:content)
	end
end
