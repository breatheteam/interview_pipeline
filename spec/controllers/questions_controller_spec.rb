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
end
