require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "viewing the index" do
    sign_in users(:user_001)
    visit articles_path
    assert_selector "h2", text: "New article"
  end
end
