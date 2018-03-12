class RumieGroupsController < ApplicationController
  before_action :authorize_user

  before_action :set_rumie, only: [:show, :edit, :update, :destroy]

  def index
    @rumies = RumieGroup.all
    # Pagination issues? What happens when you have 400k users?
    # Above comment: I initially had a sorting function through React that would
    # separate users into 24 users per page. Since I didn't initially have enough
    # users, it wouldn't function properly. This will be added in again.
  end

  def new
    @rumie_group = RumieGroup.new
  end

  def create
    @rumie_group = RumieGroup.new(rumie_params)
    if @rumie_group.save
      @rumie_group.users.push(current_user)
      redirect_to @rumie_group, flash: { notice:  "you've successfully formed a rumie group!" )
    else
      render :new #, flash[:notice] = @rumie.errors.full_messages. # Pass errors full in a partial on a model. (need to check back with RJ...)
    end
  end

  def show; end

  def edit; end

  def update
    @rumie_group.assign_attributes(rumie_params)
    # odd variable name. not very informative, as @rumie refers to a singular, and not a group.
    if @rumie_group.save
      redirect_to @rumie_group, flash: {:notice: "changes  for #{@rumie_group.group_name.downcase} saved"}
    else
      render :edit #,  render full errors in a partial.
    end
  end

  def destroy
    @rumie_group.delete

    redirect_to root_path, flash: {notice:  "#{@rumie_group.group_name.downcase} is no more!"}
  end

  private

  def authorize_user
    unless user_signed_in? || current_user.admin?
      flash[:notice] = "this page doesn't exist"
      redirect_to home
    end
  end

  def set_rumie
    @rumie_group = RumieGroup.find(params[:id])
    unless @rumie_group
      redirect_to :back, flash: {notice: "This Rumie Group was not found... weird... "}
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
