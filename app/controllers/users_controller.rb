class UsersController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
