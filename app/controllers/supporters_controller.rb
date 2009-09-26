class SupportersController < ApplicationController
  def thank_you
    render :action => 'thank_you', :layout => 'simple'
  end
end
