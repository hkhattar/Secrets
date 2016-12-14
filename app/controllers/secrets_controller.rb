class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :delete]

  def create
  	@secret = Secret.create(content: params[:secret][:content],user_id: params[:user_id])
  	redirect_to "/users/" + params[:user_id].to_s
  end

  def delete
  	Secret.find(params[:id]).destroy
  	if params[:on_secrets] === "true"
  		redirect_to "/secrets"
  	else
  		redirect_to "/users/" + current_user.id.to_s
  	end
  end

  def index
  	@secrets = Secret.all
  	
  	render 'index'
  end
end
