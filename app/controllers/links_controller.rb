class LinksController < ApplicationController

  def index
    if !current_user
      redirect_to login_path
    else
      @link = Link.new
      @links = current_user.links.all
    end
  end

  def create
    user = current_user
    # binding.pry
    link = user.links.new(link_params)
    if link.save
      flash[:success] = "Link created successfully"
      # render root_path
      redirect_to root_path
    else
      flash[:notice] = 'Link not created'
      # render root_path
      redirect_to root_path
    end
  end

  private
  def link_params
    params.require(:link).permit(:url, :title)
  end
end
