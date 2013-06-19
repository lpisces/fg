require 'test_helper'

class HomeHotTagsControllerTest < ActionController::TestCase
  test "should get config" do
    get :config
    assert_response :success
  end

  test "should get config_save" do
    get :config_save
    assert_response :success
  end

end
