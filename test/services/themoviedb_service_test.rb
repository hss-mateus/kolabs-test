require 'test_helper'

class ThemoviedbServiceTest < ActiveSupport::TestCase
  tmdb_service = ThemoviedbService.new

  test 'should get at least one movie' do
    result = tmdb_service.search 'a', 'movie'

    assert result[:total_pages].positive?
  end

  test 'should get at least one person' do
    result = tmdb_service.search 'a', 'person'

    assert result[:total_pages].positive?
  end

  test 'should get at least one tv show' do
    result = tmdb_service.search 'a', 'tv'

    assert result[:total_pages].positive?
  end

  test 'should get at least one generic result' do
    result = tmdb_service.search 'a'

    assert result[:total_pages].positive?
  end

  test 'should retrieve an empty response for bad input' do
    movies = tmdb_service.search '??????', 'movie'
    people = tmdb_service.search '??????', 'person'
    shows = tmdb_service.search '??????', 'tv'
    all = tmdb_service.search '??????'

    assert movies[:total_pages].zero?
    assert people[:total_pages].zero?
    assert shows[:total_pages].zero?
    assert all[:total_pages].zero?
  end
end
