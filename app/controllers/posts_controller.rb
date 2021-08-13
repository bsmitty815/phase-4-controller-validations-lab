class PostsController < ApplicationController

  # def index
  #   post = Post.all
  #   render json: post
  # end

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    # if post
      post.update(post_params)

      render json: post
    # else
    #   render json: { error: invalid.record.errors }, status: :unprocessable_entity 
    # end
   

  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

end
