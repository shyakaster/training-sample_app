class ReviewsController < ApplicationController
  before_action :set_review, only:  [:show,:edit, :update]
  before_action :require_user,:except => 'show'
  before_action :require_same_user, only:[:edit,:update]
  def show

  end
  def create
    #binding.pry
    @recipe=Recipe.find(params[:recipe_id])
    @review=@recipe.reviews.build(review_params)
    @review.chef=current_user
     #binding.pry
    if @review.save
      flash[:notice]="Review successfully saved"
      redirect_to recipe_path(@recipe)
    else
      flash[:notice]="Review failed to save!"
      redirect_to :back
    end
  end
  def edit

  end
  def update

    if @review.update(review_params)
      flash[:notice]="Review was successfully updated"
      redirect_to recipe_path(@recipe)
    else
      flash[:notice]="Review failed to get updated"

      render :edit
    end
  end
 def destroy
   review=Review.find(params[:id]).destroy
   flash[:success] = "Review Deleted"
   redirect_to :back
 end
  private

  def review_params
    params.require(:review).permit(:body)
  end
  def require_same_user
    if current_user != @review.chef and !current_user.admin?
      flash[:danger]="You can only edit your own review "
      redirect_to review_path(@review)
    end
  end
  def set_review
    @review=Review.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end


end