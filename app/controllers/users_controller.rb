class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user, 
				notice: 'Cadastro criado com sucesso!'

		else
			render action: :new
		end
	end

	def show
		user_find
	end

	def edit
		user_find
	end

	def update
		user_find
		if @user.update(user_params)
			redirect_to @user,
				notice: 'Cadastro atualizado com sucesso!'
		else
			render action: :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :full_name, :location, :password, :password_confirmation, :bio)
	end

	def user_find
		@user = User.find(params[:id])
	end
end