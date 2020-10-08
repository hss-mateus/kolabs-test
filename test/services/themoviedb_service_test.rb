require 'test_helper'

class ThemoviedbServiceTest < ActiveSupport::TestCase
  tmdb_service = ThemoviedbService.new

  test 'should get at least one movie' do
    result = tmdb_service.search_movies 'a'

    assert_not_empty result
  end

  test 'should retrieve an empty response for bad input' do
    result = tmdb_service.search_movies '??????'

    assert_empty result
  end
end
