class Account::GroupsController < ApplicationController
	before_action :authenticate_user!

	def index
		@groups = Group.all.order("updated_at DESC")
	end
end
