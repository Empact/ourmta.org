class SupportersController < ApplicationController
  def new
  end

  def create
    @supporter = Supporter.new(params[:supporter])
    if @supporter.save
      flash[:success] = "You've been signed up!  Now help us get on the job by describing or voting on the problems of your commute:"
      redirect_to suggestions_information_path
    else
      render :action => "new"
    end
  end

  def thank_you
    @exclude_from_authentication = true
    render :action => 'thank_you', :layout => 'simple'
  end
end
