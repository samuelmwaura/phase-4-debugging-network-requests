class MoviesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid_response
  
  def index
    movies = Movie.all
    render json: movies, status: :created
  end

  def create
    bird = Bird.create!(movie_params)
    render json: bird
  end

  private

  def movie_params
    params.permit(:title, :year, :length, :director, :description, :poster_url,:category,:discount, :female_director)
  end

  def render_record_invalid_response(invalid)
    render json: {errors:invalid.record.errors}, tatus: :unprocessable_entity 
  end
end
