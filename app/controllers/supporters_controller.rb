class SupportersController < ApplicationController
  def new
    @supporter = Supporter.new
  end

  def create
    @supporter = Supporter.new(params[:supporter])
    if @supporter.save
      redirect_to root_path
    else
      redirect_to new_supporter_path
    end
  end
end
