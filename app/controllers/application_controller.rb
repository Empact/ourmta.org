# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  layout 'site'

  before_filter :authenticate
  before_filter :prepare_supporter

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  private

  def prepare_supporter
    @supporter = Supporter.new
  end

  def authenticate
    unless @exclude_from_authentication
      authenticate_or_request_with_http_basic do |name, password|
        name == ENV['FIXMTA_BETA_USERNAME'] && password == ENV['FIXMTA_BETA_PASSWORD']
      end
    end
  end
end
