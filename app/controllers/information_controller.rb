class InformationController < ApplicationController
  def index
    expires_in 2.hours, :public => true
  end

  def problems
    redirect_to possibilities_information_path
  end

  def possibilities
    expires_in 24.hours, :public => true
  end

  def placeholder
    expires_in 24.hours, :public => true
  end
end
