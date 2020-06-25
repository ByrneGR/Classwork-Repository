require 'rails_helper'

RSpec.describe UsersController, type: :controller do #add type so it looks in right location
  describe "POST#create" do 
    context "valid params" do
      it "redirects user to the index page if user successfully created" do
        post :create, params: {
          user: { email: "artem@gmail.com", password: "wednesday"}
        }
        expect(response).to render_template(:index)
      end
    end
    
    context "invalid params" do
      it "will validate the password length to ensure at least 6 characters" do
        post :create, params: {
          user: { email: "artem@gmail.com", password: "day"}
        }

        expect(flash.now[:errors]).to be_present 
      end 
    end
  end
end         
