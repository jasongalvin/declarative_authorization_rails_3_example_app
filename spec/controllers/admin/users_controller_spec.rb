require 'spec_helper'

describe Admin::UsersController do

  describe "GET index" do
    
    context "when user is a guest" do
      it "does not allow the page to be viewed" do
        get :index
        response.should_not be_success
      end
    end
    
    context "when user is logged in" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        sign_in user
      end
      it "allows the page to be viewed" do
        get :index
        response.should be_success
      end
    end
    
  end

end
