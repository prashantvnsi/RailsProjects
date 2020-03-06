require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase

  test 'authenticated users can GET index' do
    sign_in users(:user_001)

    get :index
    assert_response :success
  end

  test "viewing the index" do
    visit articles_path
    assert_selector "h1", text: "Articles"
  end
end
