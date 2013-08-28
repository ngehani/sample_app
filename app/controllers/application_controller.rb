class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Sessions Heloer Module - Available in views by default but not in controllers
  # Therefore include it explicitly
  include SessionsHelper
end
