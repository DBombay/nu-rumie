class RumieGroupsController < ApplicationController
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

  private

  def rumie_params
    params.require(:rumie_group).permit(
      :group_name,
      :max_users,
      :description,
      :creator_id
    )
  end
end
