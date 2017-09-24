require 'application_responder'
# The application controller
class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :html
end
