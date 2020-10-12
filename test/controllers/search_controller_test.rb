require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_path
    assert_response :success
  end

  test 'should provide correct title' do
    get root_path, params: { q: 'foo' }

    assert_response :success
    assert_select 'title', 'foo - Media Search'
  end
end
