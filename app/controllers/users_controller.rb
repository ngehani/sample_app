class UsersController < ApplicationController
<<<<<<< HEAD

	def show
		@user = User.find(params[:id])
	end
	
	def new
	
	end
=======
  def show
  	@user = User.find(params[:id])
  end
  
  def new
  end
>>>>>>> sign-up
end
