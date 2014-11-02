class Blog < ActiveRecord::Base
	belongs_to :user
	
	scope :approved, -> { where(approve: true) }
end
