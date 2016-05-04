require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
	describe "question#update action" do
		it "should allow users to successfully update question" do
			user = FactoryGirl.create(:user)
			sign_in user
			question = FactoryGirl.create(:question, content: "Original question")
			patch :update, id: question.id, question: {content: "New question"}
			expect(response).to redirect_to questions_path
			question.reload
			expect(question.content).to eq "New question"
		end

		it "should have http 404 if question cannot be found" do
			user = FactoryGirl.create(:user)
			sign_in user 
			patch :update, id: "hi", question: {content: "New question"}
			expect(response).to have_http_status(:not_found)
		end

		it "should render the edit form with http status of unprocessable_entity" do 
			user = FactoryGirl.create(:user)
			sign_in user
			question = FactoryGirl.create(:question)
			patch :update, id: question.id, question: {content: ""}
			expect(response).to have_http_status(:unprocessable_entity)
		end
	end

	describe "question#edit action" do 
		it "should require user to be logged in" do
			question = FactoryGirl.create(:question)
			get :edit, id: question.id
			expect(response).to redirect_to new_user_session_path
		end

		it "should successfully show the edit form if user is logged in" do
			user = FactoryGirl.create(:user)
			sign_in user 
			question = FactoryGirl.create(:question)
			get :edit, id: question.id
			expect(response).to have_http_status(:success)
		end

		it "should return a 404 error message if the gram is not found" do
			user = FactoryGirl.create(:user)
			sign_in user
			get :edit, id: "hi"
			expect(response).to have_http_status(:not_found)
		end
	end

	describe "questions#index action" do
		it "should require user to be logged in" do 
			get :index
			expect(response).to redirect_to new_user_session_path
		end

		it "should show successfully show the index page" do 
			user = FactoryGirl.create(:user)
			sign_in user
			get :index
			expect(response).to have_http_status(:success)
		end 
	end
	
	describe "questions#new action" do
		it "should require users to be logged in" do 
			get :new
			expect(response).to redirect_to new_user_session_path
		end

		it "should successfully show the new form" do
			user = FactoryGirl.create(:user)
			sign_in user
			get :new
			expect(response).to have_http_status(:success)
		end
	end

	describe "question#create action" do 
		it "should require users to be logged in" do
			post :create, question: { content: "What is the salary?" }
			expect(response).to redirect_to new_user_session_path
		end

		it "should successfully add a new question to our database" do
 	 	user = FactoryGirl.create(:user)
			sign_in user
			post :create, question: {content: "What is the salary?"}
			expect(response).to redirect_to questions_path

			question = Question.last
			expect(question.content).to eq("What is the salary?")
			expect(question.user).to eq(user)
		end

		it "should not save a blank question" do 
			user = FactoryGirl.create(:user)
			sign_in user
			post :create, question: {content: "" }
			expect(response).to have_http_status(:unprocessable_entity)
			expect(Question.count).to eq 0
		end
	end


end
