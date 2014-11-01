class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_profile, only: [:show, :edit, :update]
	
	
	def new
		@profile = Profile.new
	end
	
	#create new profile
	def create
		@profile = current_user.build_profile(profile_params)
		respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile }
      else
        format.html { render :new }
      end
    end
	end
	
	def update
		respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile}
      else
        format.html { render :edit }
      end
    end
	end
  
	private
	
 def set_profile
	 @profile = Profile.find(params[:id])
 end
 
 def profile_params
	params.require(:profile).permit(:first_name, :last_name, :address_line_one, :address_line_two)
end

end
