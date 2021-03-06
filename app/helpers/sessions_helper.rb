module SessionsHelper
	#Listing 8.19
	def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  #Listing 8.23
  def signed_in?
    !current_user.nil?
  end

  #Listing 8.20 - makes current_user global
  def current_user=(user)
    @current_user = user
  end

  #Listion 8.22
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  #Listing 9.15
  def current_user?(user)
    user == current_user
  end

  #Listing 10.24
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  #Listing 8.30
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  #Listing 9.17
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
