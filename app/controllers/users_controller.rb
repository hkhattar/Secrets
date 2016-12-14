class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
  def show
  	@user = User.find(session[:id])
  	@user_secrets = User.find(session[:id]).secrets
  	@user_liked_secrets = User.find(session[:id]).secrets_liked
  	render 'show'
  end

  def new
  	render 'new'
  end

  def edit
  	@user = User.find(params[:id])
  	render 'edit'
  end

  def create
  	# @user = User.create(email: params[:user][:email],name: params[:user][:name],password: params[:user][:password],password_confirmation: params[:user][:password_confirmation])
 	@user = User.create(user_params)

 	session[:name] = @user.name
 	session[:id] = @user.id
 	redirect_to "/users/" + @user.id.to_s
  end

  def update
  	@user = User.update(params[:id],user_params)
  	redirect_to "/users/" + @user.id.to_s
  end

  def delete
  	User.find(params[:id]).delete
  	redirect_to '/sessions/new'
  end


  private
  def user_params
  	params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
