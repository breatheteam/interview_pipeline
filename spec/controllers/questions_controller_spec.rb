require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
	describe "questions#index action" do
		it "show successfully show the index page" do 
			get :index
			expect(response).to have_http_status(:success)
		end 
	end
	
end
