class AuthorsController < ApplicationController
  # rescue_from ActiveRecord::RecordInvalid, with: :render_error_response
  
  # def index
  #   author = Author.all
  #   render json: author
  # end

  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create(author_params)

    render json: author, status: :created

  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity 
    # included the status code of 422 Unprocessable Entity, indicating this was a bad request.

  end

  private

  # def render_error_response(invalid)
  #   render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  # end
  
  def author_params
    params.permit(:email, :name)
  end
  
end
