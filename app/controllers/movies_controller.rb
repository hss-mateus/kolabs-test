class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    movie = params
      .require(:movie)
      .permit(:title, :release_date, :description, :poster, :score, :genres)

    @movie = Movie.new(movie)

    if @movie.save
      redirect_to movies_url
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
  end
end
