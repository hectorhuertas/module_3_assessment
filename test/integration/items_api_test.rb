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

  test "items show endpoint" do
    create_items(1)

    get "/api/v1/items/1"
    assert response.success?
    assert_equal 200, response.status

    item = Item.last
    assert_equal json['item']['id'], item.id
    assert_equal json['item']['name'], item.name
    assert_equal json['item']['description'], item.description
    assert_equal json['item']['image_url'], item.image_url
    refute json['item']['created_at']
    refute json['item']['updated_at']
  end

  test "item deletion endpoint" do
    create_items(2)
    assert_equal Item.count, 2

    delete '/api/v1/items/1'
    assert response.success?
    assert_equal 204, response.status
    assert_equal Item.count, 1
  end
end
