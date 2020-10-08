class SearchController < ApplicationController
  def initialize
    @tmdb_service = ThemoviedbService.new
  end

  def index
    query = params[:q]

    @matches =
      case params[:filter]
      when 'tv_shows'
        @tmdb_service.search_tv_shows query
      when 'people'
        @tmdb_service.search_people query
      when 'movies'
        @tmdb_service.search_movies query
      else
        @tmdb_service.search_all query
      end
  end
end
