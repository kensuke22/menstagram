require 'test_helper'

class RamenCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get ramen_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get ramen_comments_destroy_url
    assert_response :success
  end

end
