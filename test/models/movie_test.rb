require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  def setup
    @base_movie = { title: 'Foobar',
                    release_date: Time.now,
                    description: 'foobar',
                    poster: 'https://placekitten.com/300/400',
                    score: 5.9,
                    genres: [1, 2] }
  end

  test 'should create a movie' do
    assert_difference 'Movie.count' do
      Movie.create(@base_movie)
    end
  end

  test 'should deny any empty field' do
    invalid_movie = @base_movie.dup
    invalid_movie[:title] = nil

    assert Movie.new(invalid_movie).invalid?
  end

  test 'should not store two movies with same title' do
    assert_difference('Movie.count', 1) do
      Movie.create(@base_movie)
      Movie.create(@base_movie)
    end
  end
end
