class ActionsController < ApplicationController

  def stories
    expires_in 24.hours, :public => true
  end

end
