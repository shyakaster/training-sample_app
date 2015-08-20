class IngredientsController < ApplicationController
  def new
    @ingredient=Ingredient.new
  end
  def create
  @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:notice]="You have successfully saved your ingredient"
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  def edit
    @ingredient=Ingredient.find(params[:id])
  end
  def update
    @ingredient=Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      flash[:notice]="You have successfully updated your ingredient"
      redirect_to recipes_path
    else
      render 'edit'
    end
  end
  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end