class LandlordController < ApplicationController
  before_action :authorize_user

  def new
    @landlord = Landlord.new
  end

end
