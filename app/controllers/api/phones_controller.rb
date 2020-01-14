class Api::PhonesController < ApplicationController

  def index
    phones =  Phone.order(id: :DESC)
    render json: {status: 'SUCCESS', message: 'Loaded all phones', data: phones}, status: :ok
  end

   def create
    user = User.find(post_params[:user_id])
    if user.present?
      validate_number = Phone.find(post_params[:phonenumber].to_i)
      if validate_number.present?
        render json: { status: 'ERROR', message: 'phone number already exists', data: post.errors }
      else
        phone = Phone.create(phone_number: post_params[:phonenumber],user_id: user.id )
        if phone.save
          render json: { status: 'SUCCESS', message: 'phone number save successfully', data: post }
        else
          render json: { status: 'ERROR', message: 'phone number saved', data: post.errors }
        end
      end
    else
      render json: { status: 'ERROR', message: 'user does not exists', data: post.errors }
    end
  end

  private
    def post_params
      params.permit(:user_id,:phonenumber)
    end

end