class SearchController < ApplicationController
  def index
    @products = BestBuyService.new.search(params['product']['search'])
  end
end
