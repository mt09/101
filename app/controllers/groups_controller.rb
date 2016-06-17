class GroupsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def join
		@group = Group.find(params[:id])

		if !current_user.is_member_of?(@group)
			current_user.join!(@group)
			redirect_to :back, notice: "Successfully joined."
		else
			flash[:warning] = "You're member already."
		end
	end

	def quit
		@group = Group.find(params[:id])

		if current_user.is_member_of?(@group)
			current_user.quit!(@group)
			redirect_to :back, notice: "Seec you next time."
		else
			flash[:warning] = "Bye."
		end
	end

	def index
		@groups = Group.all
	end

	def show
		@group = Group.find(params[:id])
		@posts = @group.posts
	end

	def destroy
		@group = current_user.groups.find(params[:id])
		@group.destroy
		redirect_to groups_path
	end

	def new
		@group = Group.new
	end

	def create
		@group = current_user.groups.new(group_params)

		if @group.save
			redirect_to groups_path, notice: "COOL"
		else
			render :new
		end
	end

	def edit
		@group = current_user.groups.find(params[:id])
	end

	def update
		@group = current_user.groups.find(params[:id])

		if @group.update(group_params)
			redirect_to groups_path
		else
			render :edit
		end
	end

	private

	def group_params
		params.require(:group).permit(:title, :description)
	end
end
