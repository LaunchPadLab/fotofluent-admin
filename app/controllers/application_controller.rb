class ApplicationController < ActionController::Base
  include RailsUtil::JsonHelper
  protect_from_forgery with: :exception
end
