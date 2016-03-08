class SearchController < ApplicationController
  def index
    keywords = params['product']['search']
    @conn = Faraday.new(url: 'https://api.bestbuy.com', params: {apiKey: ENV['BEST_BUY_API_KEY']})
    response = @conn.get("/v1/products(manufacturer=#{keywords})?format=json&pageSize=15&show=sku,name,customerReviewAverage,shortDescription,salePrice,image")
    @products = JSON.parse(response.body)['products']
  end
end
