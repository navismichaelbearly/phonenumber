class Api::UsersController < ApplicationController
  def index
    users = User.order(created_at: :desc)
    render json: {status: 'SUCCESS', message: 'Loaded all posts', data: users}, status: :ok
  end

  def show
    user = User.find(params[:id]).phone
    render json: { status: 'SUCCESS', message: 'loaded the post', data: user }
  end

  def create
  	user = User.create( post_params[:firstname],post_params[:lastname],post_params[:email] )
  	if user.save
      render json: { status: 'SUCCESS', message: 'user created successfully successfully', data: post }
    else
      render json: { status: 'ERROR', message: 'unable to create user', data: post.errors }
    end
  end

  private
    def post_params
      params.permit(:firstname,:lastname,:email)
    end
end