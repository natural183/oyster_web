require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get efficacy" do
    get :efficacy
    assert_response :success
  end

end
