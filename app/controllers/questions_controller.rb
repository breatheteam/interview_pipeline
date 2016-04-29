class QuestionsController < ApplicationController

	def index

	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.create(question_params)
		if @question.valid?
			redirect_to questions_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	private

	def question_params
		params.require(:question).permit(:content)
	end
end
