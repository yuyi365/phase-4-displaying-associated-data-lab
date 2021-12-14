class ItemsController < ApplicationController
  wrap_parameters false

  # GET /items
  def index
    items = Item.all
    render json: items, include: :user, status: :ok
  end
end
