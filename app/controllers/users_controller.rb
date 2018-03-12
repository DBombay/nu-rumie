class UsersController < ApplicationController
  before_action :authorize_user, except: [:index, :show, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.rumie_group
      @rumie_group = RumieGroup.find(@user.rumie_group)
      @user.rumie_group = nil
      if @user.save
        flash[:notice] = "#{@user.first_name.downcase} removed successfully from
        #{@rumie_group.group_name.downcase}"
      else
        flash[:notice] = @rumie_group.errors.full_messages
      end
      redirect_to root_path
    else
      @rumie_group = RumieGroup.find(params[:group_id])
      @rumie_group.users << @user
      flash[:notice] = "you've succesfully joined #{@rumie_group.group_name}!"
      redirect_to @rumie_group
    end
  end
end
