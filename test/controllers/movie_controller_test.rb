require 'test_helper'

class MovieControllerTest < ActionDispatch::IntegrationTest
  def setup
    @sample_movie = { title: 'Foobar',
                      release_date: Time.now,
                      description: 'foobar',
                      poster: 'https://placekitten.com/300/400',
                      score: 5.9,
                      genres: '1,2' }
  end

  test 'should get index' do
    get movies_path
    assert_response :success
  end

  test 'should get new' do
    get new_movie_path
    assert_response :success
  end

  test 'should create an correct movie' do
    assert_difference 'Movie.count' do
      post movies_path, params: { movie: @sample_movie }
    end
  end

  test 'should not create an existing movie' do
    assert_difference('Movie.count', 1) do
      post movies_path, params: { movie: @sample_movie }
      post movies_path, params: { movie: @sample_movie }
    end
  end

  test 'should get edit for an existing movie' do
    movie = Movie.create(@sample_movie)

    get edit_movie_path movie

    assert_response :success
  end

  test "should get an error if movie doesn't exist" do
    get edit_movie_path '123'

    assert_redirected_to movies_path
  end

  test 'should update movie title' do
    movie = Movie.create(@sample_movie)

    movie[:title] = 'New title'

    patch movie_path movie[:id], params: { movie: movie.attributes }

    assert_redirected_to movies_path
  end

  test 'should not update movie title to an existing title' do
    first_movie = Movie.create(@sample_movie)

    second_movie = @sample_movie.dup
    second_movie[:title] = 'Second Movie'
    second_movie = Movie.create(second_movie)

    first_movie[:title] = second_movie[:title]

    put movie_path first_movie[:id], params: { movie: first_movie.attributes }

    assert_response :success
  end

  test 'should delete a movie' do
    movie = Movie.create(@sample_movie)

    assert_difference('Movie.count', -1) do
      delete movie_path movie
      assert_redirected_to movies_path
    end
  end

  test 'should not delete an inexistent movie' do
    assert_no_difference 'Movie.count' do
      delete movie_path '123'
      assert_redirected_to movies_path
    end
  end
end
