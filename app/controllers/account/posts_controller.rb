class Account::PostsController < ApplicationController
	before_action :authenticate_user!

	def index
		@posts = Post.order("updated_at DESC")
	end
end
