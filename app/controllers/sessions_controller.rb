class SessionsController < ApplicationController

	#Listing 8.3
	def new
  end

  # Listing 9.19 modified
  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  #Listing 8.29
  def destroy
    sign_out
    redirect_to root_url
  end

end
