require_relative '../test_helper'

class ProjectSetupTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end


  test "items index endpoint" do
    get "/api/v1/items"
    assert_equal response.status, 200
    # assert_equal response.lenght, 500
  end
end
