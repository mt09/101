class Account::GroupsController < ApplicationController
	before_action :authenticate_user!

	def index
		@groups = Group.all.order("posts_count DESC")
	end
end
