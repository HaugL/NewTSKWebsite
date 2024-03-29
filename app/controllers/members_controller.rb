class MembersController < ApplicationController
		skip_before_filter :validated_member_is_logged_in, :only => [:new, :create]
	def new
		@member = Member.new
		render 'edit'
	end 

	def create
	  @member = Member.new(params[:member])
	  if @member.save
	    redirect_to root_url, :notice => "Signed up!"
	  else
	    render "new"
	  end
    end
end
