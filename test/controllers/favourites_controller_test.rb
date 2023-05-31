require "test_helper"

class FavouritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favourites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favourites_destroy_url
    assert_response :success
  end

  test "should get favourite_params" do
    get favourites_favourite_params_url
    assert_response :success
  end
end
