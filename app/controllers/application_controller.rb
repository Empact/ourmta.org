# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  expires_in 2.hours, :public => true

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  layout 'site'

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
