class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    user = User.find_by(google_id: params[:id])
    begin 
      render json: UserSerializer.new(User.find(params[:id])) if user.nil?
      render json: UserSerializer.new(user)
    end
  end

  def create 
    begin 
      render json: UserSerializer.new(User.create!(user_params))
    end
  end

  def update
    begin
      render json: UserSerializer.new(User.update!(params[:id], user_params))
    end
  end

  def destroy
    begin
      render json: UserSerializer.new(User.destroy(params[:id]))
    end
  end

  private

  def user_params
    params.permit(:email, :google_id, :name, :intolerances, :likes, :dislikes, :dietary_restrictions)
  end
end