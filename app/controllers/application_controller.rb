# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  layout 'site'

  before_filter :ensure_domain

  DOMAIN = 'ourmta.org'

  def ensure_domain
    if request.env['HTTP_HOST'] != DOMAIN
      redirect_to DOMAIN
    end
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
