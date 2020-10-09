class MoviesController < ApplicationController
  before_action :movie_by_id_param, only: %i[edit update destroy]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_url
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy

    redirect_to movies_url
  end

  private

  def movie_params
    params
      .require(:movie)
      .permit(:title, :release_date, :description, :poster, :score, :genres)
  end

  def movie_by_id_param
    @movie = Movie.find_by_id(params[:id])
  end
end
