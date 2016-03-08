class SearchController < ApplicationController
  def index
    @conn = Faraday.new(url: 'https://api.bestbuy.com/v1', params: {apiKey: ENV['BEST_BUY_API_KEY']})
    # b = @conn.get('/products(manufacturer=sennheiser&salePrice<1000)?format=json&show=sku,name,salePrice')
    # json = JSON.parse b.body

    z = Faraday.get("https://api.bestbuy.com/v1/products(manufacturer='sennheiser'&salePrice<1000)?format=json&show=sku,name,salePrice&apiKey=rab5wajs56dheukch9svjkkm")
    binding.pry
  end
end
