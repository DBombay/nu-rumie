class RumieGroupsController < ApplicationController
  def new
    @rumie = RumieGroup.new
  end
end
