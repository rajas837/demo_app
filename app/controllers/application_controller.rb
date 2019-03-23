class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception, if: Proc.new { | c | c.request.format.json?} 
    before_action :verify_session
    def verify_session
      if session[:user_id].nil?
        flash[:notice] = "You need to sign_in first"
        redirect_to sign_in_users_path
      end
    end
    def current_user
      User.find session[:user_id]
    end
end
