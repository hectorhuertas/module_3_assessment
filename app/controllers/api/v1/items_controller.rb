class Api::V1::ItemsController < ApplicationController
  respond_to :json
  def index
    respond_with 'bob'
  end
end
