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
      
      let(:admin) { FactoryGirl.create(:user) }
      
      before do
        sign_in admin
        role = FactoryGirl.create :role, :name => 'admin'
        FactoryGirl.create :assignment, :user => admin, :role => role
      end
      
      it "allows the page to be viewed" do
        get :index
        response.should be_success
      end
      
      describe "PUT update_roles" do
        let(:user) { FactoryGirl.create :user }
        let(:author_role) { FactoryGirl.create :role, :name => 'author' }

        it "should update roles of the requested user" do
          put :update_roles,
              :id => user.to_param,
              :role_ids => [author_role.to_param]

          assigns(:user).should_not be_nil
          assigns(:user).roles.should eq [author_role]
          response.should redirect_to admin_user_path(assigns(:user))
        end
      end
      
    end
    
  end

end
