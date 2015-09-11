class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize
  before_action :current_resource, only: [:show, :edit, :update, :destroy]
  delegate :authorized?, to: :user_access
  
  
  private
    def user_access
      @authorized ||= Access.new(current_user)
    end
    def current_resource
      nil
    end


    def authorize
      if !user_access.authorized?(controller_name,action_name,requested_resource)
        flash.now[:error] = "Not Authorized, looks like you're not suppose to be here"
      end
    end
end
