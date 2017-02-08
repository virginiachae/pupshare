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
  end

  def update
  end

  def destroy
  end


  private
  def review_params
    params.require(:review).permit(:title, :comment)
end



end
