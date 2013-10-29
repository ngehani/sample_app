class StaticPagesController < ApplicationController
  #Listing 10.31, 10.38
  def home
    if signed_in?
    	@micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
