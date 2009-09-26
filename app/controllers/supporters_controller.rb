class SupportersController < ApplicationController
  def thank_you
    expires_in 2.hours, :public => true
    render :action => 'thank_you', :layout => 'simple'
  end
end
