class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new, status: :unprocessable_entity, notice: "Movie could not be added"
    end
  end

  def edit; end

  def update
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destoy
    if @movie.destroy
      redirect_to movies_path
    else
      render :new, status: :unprocessable_entity, notice: "Movie not removed"
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :rating, :score, :image)
  end
end
