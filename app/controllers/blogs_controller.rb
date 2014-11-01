class BlogsController < ApplicationController
	before_action :authenticate_user!, except: [:show]
	before_action :set_blog, only: [:show, :edit, :update,:blog_approve]
	
	def index
		@blogs = current_user.list_blog
	end
	
	def new
		@blog = Blog.new
	end
	
	#create new blog
	def create
		@blog = current_user.blogs.build(blog_params)
		respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog }
      else
        format.html { render :new }
      end
    end
	end
	
	def update
		respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog}
      else
        format.html { render :edit }
      end
    end
	end
	
	def blog_approve
		@blog.update_attributes(approve: params["approve"])
		render json: {approve: @blog.approve}
	end
  
	private
	
 def set_blog
	 @blog = Blog.find(params[:id])
 end
 
 def blog_params
	params.require(:blog).permit(:title, :description)
end
		
end
