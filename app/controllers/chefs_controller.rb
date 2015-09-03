class ChefsController < ApplicationController
  before_action :set_chef, only: [:edit,:update, :show]
  before_action :require_user, except: [:show,:index,:new,:create]
  before_action :require_same_user, only: [:edit,:update]
  before_action :require_user_destroy, only: [:destroy]
  def index
    @chefs=Chef.paginate(page: params[:page],per_page: 2)

  end
  def new
  @chef=Chef.new
  end
  def create
  @chef=Chef.create(chef_params)
    if @chef.save
      session[:chef_id]=@chef.id
      flash[:notice]="Your account has been created"
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @chef.update_attributes(chef_params)
      flash[:notice]="You account has been updated"
      redirect_to chef_path(@chef)
    else
      render 'edit'
    end
  end
  def show
    @recipes=@chef.recipes.paginate(page: params[:page], per_page: 2)
  end
  def destroy
    chef=Chef.find(params[:id]).destroy
    flash[:notice]="#{chef.chefname} is destroyed!"
    redirect_to chefs_path
    session[:chef_id]= nil
  end

  private

  def chef_params
    params.require(:chef).permit(:chefname, :email,:password)
  end
  def set_chef
    @chef=Chef.find(params[:id])
  end
  def require_same_user
    if @chef != (@chef or current_user.admin)
      flash[:notice]="You can only edit your own profile"
      redirect_to root_path
    end
  end
  def require_user_destroy
    if !current_user.admin?
      flash[:notice]="You must be admin to delete a user!"
      redirect_to :back
    end
  end
end