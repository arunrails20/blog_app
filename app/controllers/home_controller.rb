class HomeController < ApplicationController
	
	def index
		@blogs = Blog.where(approve: true)
	end
	
end
