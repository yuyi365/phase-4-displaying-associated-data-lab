class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  wrap_parameters false

  #GET /users/:id
  def show
    user = User.find(params[:id])
    render json: user, include: :items, status: :ok
  end

  private

  def render_not_found
    render json: { error: 'user not found' }, status: :not_found
  end
end
