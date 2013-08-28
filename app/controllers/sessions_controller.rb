class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
    	if user && user.authenticate(params[:session][:password])
      		# Sign the user in and redirect to the user's show page.
      		sign_in user
      		redirect_to user
    	else
    		
    		# Flash [:error] comes from bootstap CSS
      		flash.now[:error] = 'Invalid email/password combination'

			# This line activates the link signin to show the page view new.html.erb
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end
