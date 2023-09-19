class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show destroy]

  def index
    @movies = Movie.all.order(:score).reverse
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
    @actors = Actor.select(:name).map(&:name).uniq
    @genres = Genre.select(:name).map(&:name).uniq
  end

  def create
    @movie = Movie.new(movie_params)
    @movie_actor = ActorsToMovie.new(movie_id: @movie.id, actor_id: @actors)
    @movie_genre = GenreToMovie.new(movie_id: @movie.id, genre_id: @genre)
    if @movie.save && @movie_actor.save && @movie_genre.save
      redirect_to movie_path(@movie)
    else
      render :new, status: :unprocessable_entity, notice: "Movie could not be added"
    end
  end

  def destroy
    if @movie.destroy
      redirect_to movies_path
    else
      render :see_other, status: :unprocessable_entity, notice: "Movie could not be removed"
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
