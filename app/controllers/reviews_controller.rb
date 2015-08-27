class ReviewsController < ApplicationController
  before_action :set_review, only:  [:index,:show,:edit, :update,:review_like]
  before_action :require_user,except: [:show,:review_like]
  before_action :require_user_like, :only =>'review_like'
  before_action :require_same_user, only:[:edit,:update]
  def index
    #@reviews=Review.paginate(page: params[:page], per_page: 2)
    # @recipes=Recipes.paginate(page: params[:page], per_page: 2)

  end
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
  def review_like
   # @recipe=Recipe.find(params[:recipe_id])
    @review_like=ReviewLike.create(review_like: params[:review_like], chef: current_user,
                                   recipe: @recipe, review: @review)
    if like.valid?
      flash[:notice]="Your vote was successful"
      redirect_to :back
    else
      flash[:notice]="Your vote was not successful"
      redirect_to :back
    end
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
  def require_user_like
    if !logged_in?
      flash[:notice]="You must be logged in to perform this action"
      redirect_to :back
    end
  end
  def set_review
    @review=Review.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end


end