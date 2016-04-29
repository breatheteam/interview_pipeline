require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
	describe "questions#index action" do
		it "should show successfully show the index page" do 
			get :index
			expect(response).to have_http_status(:success)
		end 
	end
	
	describe "questions#new action" do
		it "should successfully show the new form" do
			get :new
			expect(response).to have_http_status(:success)
		end
	end

	describe "question#create action" do 
		it "should successfully add a new question to our database" do
			post :create, question: {content: "What is the salary?"}
			expect(response).to redirect_to questions_path

			question = Question.last
			expect(question.content).to eq("What is the salary?")
		end

		it "should not save a blank question" do 
			post :create, question: {content: "" }
			expect(response).to have_http_status(:unprocessable_entity)
			expect(Question.count).to eq 0
		end
	end
end
