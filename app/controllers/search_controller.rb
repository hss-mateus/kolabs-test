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
        @movies = @tmdb_service.search_movies query
        store_movies
        @movies
      else
        results = @tmdb_service.search_all query
        @movies = filter_movies results
        store_movies
        results
      end
  end

  def filter_movies(results)
    return if results.nil? || results.empty?

    results.select { |r| r['media_type'] == 'movie' }
  end

  def store_movies
    return if @movies.nil? || @movies.empty?

    movies = @movies.map do |m|
      { id: m['id'],
        title: m['original_title'],
        release_date: m['release_date'],
        description: m['overview'],
        poster: 'https://image.tmdb.org/t/p/w300' + m['poster_path'],
        score: m['vote_average'],
        genres: m['genre_ids'].join(','),
        created_at: Time.now,
        updated_at: Time.now }
    end

    Movie.insert_all(movies)
  end
end
