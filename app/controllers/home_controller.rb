class HomeController < ApplicationController
	
	def index
		@blogs = Blog.approved
	end
	
end
