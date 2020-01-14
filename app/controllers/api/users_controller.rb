class Api::UsersController < ApplicationController
  def index
    users = User.order(created_at: :desc)
    render json: {status: 'SUCCESS', message: 'Loaded all posts', data: users}, status: :ok
  end

  def show
    user = User.find(params[:id]).phone
    render json: { status: 'SUCCESS', message: 'loaded the post', data: user }
  end

end