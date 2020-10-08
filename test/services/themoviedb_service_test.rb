require 'test_helper'

class ThemoviedbServiceTest < ActiveSupport::TestCase
  tmdb_service = ThemoviedbService.new

  test 'should get at least one movie' do
    result = tmdb_service.search_movies 'a'

    assert_not_empty result
  end

  test 'should get at least one person' do
    result = tmdb_service.search_people 'a'

    assert_not_empty result
  end

  test 'should get at least one tv show' do
    result = tmdb_service.search_tv_shows 'a'

    assert_not_empty result
  end

  test 'should get at least one generic result' do
    result = tmdb_service.search_all 'a'

    assert_not_empty result
  end

  test 'should retrieve an empty response for bad input' do
    result_movies = tmdb_service.search_movies '??????'
    result_people = tmdb_service.search_people '??????'
    result_shows = tmdb_service.search_tv_shows '??????'
    result_all = tmdb_service.search_tv_shows '??????'

    assert_empty result_movies
    assert_empty result_people
    assert_empty result_shows
    assert_empty result_all
  end
end
