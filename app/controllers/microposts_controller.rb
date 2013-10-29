class MicropostsController < ApplicationController
  #Listing 10.27, 10.46
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
  	@micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      #Listing 10.42
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    #Listing 10.46
    @micropost.destroy
    redirect_to root_url
  end

   private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    #Listing 10.46
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end