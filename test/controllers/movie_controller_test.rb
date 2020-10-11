require 'test_helper'

class MovieControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get movies_path
    assert_response :success
  end
end
