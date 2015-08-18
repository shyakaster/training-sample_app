class ChefsController < ApplicationController
  def index

  end
  def new
  @chef=Chef.new
  end
  def create
  @chef=Chef.create(chef_params)
    if @chef.save
      flash[:notice]="Your account has been created"
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  def edit
   @chef=Chef.find(params[:id])
  end
  def update
    @chef=Chef.find(params[:id])
    if @chef.update_attributes(chef_params)
      flash[:notice]="You account has been updated"
      redirect_to recipes_path
    else
      render 'edit'
    end
  end
  def show
    @chef=Chef.find(params[:id])
  end

  private

  def chef_params
    params.require(:chef).permit(:chefname, :email,:password)
  end
end