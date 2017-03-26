class RumieGroupsController < ApplicationController
  def new
    @rumie = RumieGroup.new
  end

  def create
    @rumie = RumieGroup.new

    if @rumie.save
      flash[:notice] = "you've successfully formed a rumie group!"
      redirect to @rumie
    else
      flash[:notice] = @bar.errors.full_messages
      render :new
    end
  end

  def index
    @rumies = RumieGroup.all
  end
end
