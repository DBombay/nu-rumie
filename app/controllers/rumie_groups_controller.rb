class RumieGroupsController < ApplicationController
  before_action :authorize_user
  def new
    @rumie = RumieGroup.new
  end

  def create
    @rumie = RumieGroup.new(rumie_params)

    if @rumie.save
      flash[:notice] = "you've successfully formed a rumie group!"
      @rumie.users.push(current_user)
      redirect_to @rumie
    else
      flash[:notice] = @rumie.errors.full_messages
      render :new
    end
  end

  def index
    @rumies = RumieGroup.all
  end

  def show
    @rumie = RumieGroup.find(params[:id])
  end

  def edit
    @rumie = RumieGroup.find(params[:id])
  end

  def update
    @rumie = RumieGroup.find(params[:id])
    @rumie.assign_attributes(rumie_params)

    if @rumie.valid?
      @rumie.save
      flash[:notice] = "changes  for #{@rumie.group_name.downcase} saved"
      redirect_to @rumie
    else
      flash[:notice] = @rumie.errors.fullmessages
      render :edit
    end
  end

  def destroy
    @rumie = RumieGroup.find(params[:id])
    @rumie.delete

    flash[:notice] = "#{@rumie.group_name.downcase} is no more!"
    redirect_to root_path
  end

  private

  def authorize_user
    unless user_signed_in? || current_user.admin?
      flash[:notice] = "this page doesn't exist"
      redirect_to home
    end
  end

  def rumie_params
    params.require(:rumie_group).permit(
      :group_name,
      :max_users,
      :description,
      :creator_id,
      :city,
      :state
    )
  end
end
