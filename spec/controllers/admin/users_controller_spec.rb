require 'spec_helper'

describe Admin::UsersController do

  describe "GET index" do
    
    context "when user is a guest" do
      it "does not allow the page to be viewed" do
        get :index
        response.should_not be_success
      end
    end
    
    context "when user does not have admin role" do
      
      let(:user) { FactoryGirl.create(:user) }
      
      before do
        sign_in user
        role = FactoryGirl.create :role, :name => 'author'
        FactoryGirl.create :assignment, :user => user, :role => role
      end
      
      it "allows the page to be viewed" do
        get :index
        response.should_not be_success
      end
      
    end
    
    context "when user is admin" do
      
      let(:user) { FactoryGirl.create(:user) }
      
      before do
        sign_in user
        role = FactoryGirl.create :role, :name => 'admin'
        FactoryGirl.create :assignment, :user => user, :role => role
      end
      
      it "allows the page to be viewed" do
        get :index
        response.should be_success
      end
      
    end
    
  end

end
