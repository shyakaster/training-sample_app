class LoginsController < ApplicationController
  def new
  end

  def create
    chef=Chef.find_by_email(params[:email])
    if chef && chef.authenticate(params[:password])
      session[:chef_id]=chef.id
      flash[:notice]="You are now logged in"
      redirect_to recipes_path
    else
      flash.now[:notice]="Your password or username is incorrect"
      render 'new'
    end
  end

  def destroy
    session[:chef_id]=nil
    flash[:notice]="You have been logged out"
    redirect_to root_path
  end
end
