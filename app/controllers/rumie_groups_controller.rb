class RumieGroupsController < ApplicationController
  before_action :authorize_user

  before_action :set_rumie, only: [:show, :edit, :update, :destroy]

  def index
    @rumies = RumieGroup.all # Pagination issues? What happens when you have 400k users?
  end

  def new
    @rumie = RumieGroup.new
  end

  def create
    @rumie = RumieGroup.new(rumie_params)
    if @rumie.save
      @rumie.users.push(current_user)
      redirect_to @rumie, flash: { notice:  "you've successfully formed a rumie group!" )
    else
      render :new #, flash[:notice] = @rumie.errors.full_messages. # Pass errors full in a partial on a model. 
    end
  end

  def show; end

  def edit; end

  def update
    @rumie.assign_attributes(rumie_params)
    # odd variable name. not very informative, as @rumie refers to a singular, and not a group. 
    if @rumie.valid? && @rumie.save
      # However .valid? will already be called in the #save method
      redirect_to @rumie, flash: {:notice: "changes  for #{@rumie.group_name.downcase} saved"}
    else
      render :edit #,  render full errors in a partial. 
    end
  end

  def destroy
    @rumie.delete
    
    redirect_to root_path, flash: {notice:  "#{@rumie.group_name.downcase} is no more!"}
  end

  private

  def authorize_user
    unless user_signed_in? || current_user.admin?
      flash[:notice] = "this page doesn't exist"
      redirect_to home
    end
  end
  
  def set_rumie
    @rumie = RumieGroup.find(params[:id])
    unless @rumie
      redirect_to :back, flash: {notice: "Rumie not found... weird... "}
    end
  end
  # odd variable name. not very informative, as @rumie refers to a singular, and not a group. 


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
