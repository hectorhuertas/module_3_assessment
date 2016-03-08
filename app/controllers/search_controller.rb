class SearchController < ApplicationController
  def index
    @conn = Faraday.new(url: 'https://api.bestbuy.com/v1', params: {apiKey: ENV['BEST_BUY_API_KEY']})
    b = @conn.get('/products(manufacturer-cannon)')
    json = JSON.parse b.body
    binding.pry
  end
end
