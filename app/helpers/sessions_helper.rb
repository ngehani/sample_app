module SessionsHelper

	def sign_in(user)
	    remember_token = User.new_remember_token
	    cookies.permanent[:remember_token] = remember_token
	    user.update_attribute(:remember_token, User.encrypt(remember_token))
	    self.current_user = user
 	end

 	# A useris signed_in if current_user is non-nil - ! = not
 	def signed_in?

 		# Current user is non-nil
 		!current_user.nil?
 	end

 	# Assigning user to current_user in the session to track the user
 	def current_user=(user)
 		@current_user = user
 	end

 	# Finding the current user and remembering the token/cookie
 	def current_user

 		#encrypt the token before using find to lookup user token

 		remember_token = User.encrypt(cookies[:remember_token])
 		@current_user ||=User.find_by(remember_token: remember_token)
 	
 	end

 	def sign_out
 		self.current_user = nil
 		cookies.delete(:remember_token)
 	end

end
