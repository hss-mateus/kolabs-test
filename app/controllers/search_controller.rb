class SearchController < ApplicationController
  before_action :tmdb_service

  def index
    query = params[:q]

    @filters = [['All', :all], ['Movies', :movies], ['TV Shows', :tv_shows], ['People', :people]]

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

  private

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
        poster: image_url(m['poster_path']),
        score: m['vote_average'],
        genres: m['genre_ids'].join(','),
        created_at: Time.now,
        updated_at: Time.now }
    end

    Movie.insert_all(movies)
  end

  def image_url(url)
    base_url = 'https://image.tmdb.org/t/p/w300'
    fallback_url = 'https://semantic-ui.com/images/wireframe/white-image.png'

    url.dup&.prepend(base_url) || fallback_url
  end

  helper_method :image_url

  def tmdb_service
    @tmdb_service = ThemoviedbService.new
  end
end
