require_relative '../test_helper'

class ProjectSetupTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  def create_items(number)
    number.times do |i|
      Item.create(
      name: "Item_#{i}",
      description: "Item_description_#{i}",
      image_url: "Image_url_#{i}"
      )
    end
  end

  def json
    JSON.parse(response.body)
  end


  test "items index endpoint" do
    create_items(2)

    get "/api/v1/items"
    assert response.success?
    assert_equal response.status, 200
    assert_equal json['items'].size, 2
  end
end
