class LikesController < ApplicationController
  def create
  	@like = Like.create(user_id: params[:user_id] ,secret_id: params[:secret_id])
  	redirect_to '/secrets'
  end

  def delete
  	Like.where(secret: Secret.find(params[:secret_id]), user: current_user).destroy_all
  	redirect_to '/secrets'
  end
end
