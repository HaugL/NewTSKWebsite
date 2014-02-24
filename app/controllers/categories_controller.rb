class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new()
		render 'edit'
	end

	def create
		@category = Category.new(params[:category])

		if(@category.save)
			redirect_to admin_dashboard_path
		else
			render 'edit'
		end
	end
end
