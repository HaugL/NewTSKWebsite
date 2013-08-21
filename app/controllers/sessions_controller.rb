class SessionsController < ApplicationController
	skip_before_filter :validated_member_is_logged_in
	
	def new
		unless session[:member_id].nil?
			redirect_to root_path
		end
	end

	def create
	  member = Member.authenticate(params[:email], params[:password])
	  if member
	    session[:member_id] = member.id
	 	session[:admin] = member.admin
	    redirect_to root_url, :notice => "Logged in!"
	  else
	    flash.now.alert = "Invalid email or password"
	    render "new"
	  end
	end

	def destroy
		session.delete(:member_id)
		session.delete(:admin)
		redirect_to root_path
	end
end
