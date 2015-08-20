class StylesController < ApplicationController
  def new
  @style=Style.new
  end
  def create
    @style=Style.new(style_params)
    if @style.save
      flash[:notice]="Style was created successfully"
      redirect_to recipes_path
    else
      flash[:notice]="Style was not saved"
      render 'new'
    end
  end
  private
  def style_params
    params.require(:style).permit(:name)
  end
end