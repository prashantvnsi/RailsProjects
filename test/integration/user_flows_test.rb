require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "can see the welcome page" do
    sign_in users(:user_001)
    get "/"
    assert_select "h1", "Welcome!"
  end

  test "can create an article" do
    sign_in users(:user_001)
    get "/articles/new"
    assert_response :success
   
    post "/articles",
      params: { article: { title: "can create", body: "article successfully." } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Title:\ncan create"
  end
end
