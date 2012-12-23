require 'spec_helper'

describe ArticlesController do
  
  describe "GET new" do
    it "assigns a new article as @article" do
      get :new
      assigns(:article).should be_a_new(Article)
    end
  end
  
  context 'guest user' do
    it 'redirects to root path' do
      get :new
      response.should redirect_to root_path
    end
  end

  context 'admin user' do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      admin_role = FactoryGirl.create :role, :name => 'admin'
      editor_role_assignment = FactoryGirl.create :assignment, :user => @user, :role => admin_role
    end
    
    it 'redirects to root path' do
      get :new
      response.should render_template "articles/new"
    end
  end

end
