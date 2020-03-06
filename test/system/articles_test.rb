require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    gets '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
  end

  #test "viewing the index" do
   # visit articles_path
   # assert_selector "h1", text: "Articles"
  #end

  test "creating an article" do
    visit articles_path
   
    click_on "New Article"
   
    fill_in "Title", with: "Creating an Article"
    fill_in "Body", with: "Created this article successfully!"
   
    click_on "Create Article"
   
    assert_text "Creating an Article"
  end
end
