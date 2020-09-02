class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render locals: { movies: movies }
  end

  def show
    movie = Movie.find(params[:id])
    render locals: { movie: movie }
  end

  def new
    movie = Movie.new
    render locals: { movie: movie }
  end

  def create
    movie = Movie.create(movie_params)

    redirect_to "/movies/#{movie.id}", locals: { movie: movie }
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :year)
  end
end
