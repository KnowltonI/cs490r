class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params);
		if @user.save
			login(@user)
			redirect_to events_path, notice: "Thank you for signing up!"
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @user.update_attributes(user_params)
			redirect_to root_path, notice: 'Account updated'
		else
			render :edit
		end
	end

	def destroy
		@user.destroy
		logout
		redirect_to root_path, notice: 'Account Deleted'
	end

	private
		def set_user
	  		@user = current_user
	  	end

		def user_params
			params.require(:user).permit(:name,:email,:password,:password_confirmation)
		end
end
