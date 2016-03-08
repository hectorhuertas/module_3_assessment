require_relative '../test_helper'

class ProductSearch < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end


  # @conn = Faraday.new(url: 'https://api.bestbuy.com', params: {apiKey: ENV['BEST_BUY_API_KEY']})
  # b = @conn.get('/beta/products/mostViewed')
  # json = JSON.parse b.body

  test "product search" do
    visit root_path
    fill_in box, with:'sennheiser'
    click_on "Search"
    assert_equal '/search', current_path
  end
end
