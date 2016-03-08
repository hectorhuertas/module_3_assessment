require_relative '../test_helper'

class ProjectSetupTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end


  # @conn = Faraday.new(url: 'https://api.bestbuy.com', params: {apiKey: ENV['BEST_BUY_API_KEY']})
  # b = @conn.get('/beta/products/mostViewed')
  # json = JSON.parse b.body

  test "mostViewed" do
    get "/project_setup"
    assert 8
  end
end
