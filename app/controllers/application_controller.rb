class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :validated_member_is_logged_in

  def validated_member_is_logged_in
  	if session[:member_id].nil?
  		redirect_to login_path
  	end
  end

end
