class LinksController < ApplicationController

  def index
    # if current_user
      # go to full index page
    # else
      redirect_to login_path
  end

end
