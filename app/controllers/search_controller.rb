class SearchController < ApplicationController
  def index
    @conn = Faraday.new(url: 'https://api.bestbuy.com', params: {apiKey: ENV['BEST_BUY_API_KEY']})
    b = @conn.get('/beta/products/mostViewed')
    json = JSON.parse b.body
    binding.pry
  end
end
