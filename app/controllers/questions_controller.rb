class QuestionsController < ApplicationController
	before_action :authenticate_user!
	def index

	end

	def new
		@question = Question.new
	end

	def create
		@question = current_user.questions.create(question_params)
		if @question.valid?
			redirect_to questions_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@question = Question.find_by_id(params[:id])
		if @question.blank?
			return render_not_found if @question.blank?
		end
	end 

	def update
		@question = Question.find_by_id(params[:id])
		return render_not_found if @question.blank?

		@question.update_attributes(question_params)
		if @question.valid?
			redirect_to questions_path
		else
			return render :edit, status: :unprocessable_entity
		end
	end

	private

	def question_params
		params.require(:question).permit(:content)
	end

	def render_not_found
		render text: 'Not Found', status: :not_found
	end
end
