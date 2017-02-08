class ReviewsController < ApplicationController
  def index
    @review = Review.all
  end

  def new
    @review = Review.new
    dog_id = params[:dog_id]
    @dog = Dog.find_by(id: dog_id)
  end

  def create
    @sitter = current_sitter
    @review = Review.new(review_params)
    @review.sitter = current_sitter
    @dog = Dog.find(params[:dog_id])
    @review.dog = @dog
     if @review.save

       flash[:notice] = "Review Saved"
       redirect_to dog_path(@dog)
     end
  end

  def edit
    dog_id = params[:dog_id]
    @dog = Dog.find_by(id: dog_id)
    review_id = params[:id]
    @review = Review.find_by(id: review_id)

  end

  def update
    dog_id = params[:dog_id]
    @dog = Dog.find_by(id: dog_id)
    review_id = params[:id]
    @review = Review.find_by(id: review_id)

    if @review.update(review_params)
      flash[:notice] = "Review Updated."
      redirect_to dog_path(@dog)
    else
      redirect_to edit_dog_review_path(@dog, @review)
    end
  end

  def destroy
    dog_id = params[:dog_id]
    @dog = Dog.find_by(id: dog_id)
    @review = Review.find_by_id(params[:id])
    if @review.destroy
      flash[:notice] = "Review Deleted."
      redirect_to dog_path(@dog)
    end
  end


  private
  def review_params
    params.require(:review).permit(:title, :comment)
end



end
