class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update_roles
    @user = User.find(params[:id])
    @user.update_roles(params[:role_ids])
    redirect_to admin_user_path @user
  end

end
