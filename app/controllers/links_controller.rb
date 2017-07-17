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
    link = user.links.new(link_params)
    if link.save
      flash.now[:success] = "Link created successfully"
      render partial: 'link', locals: {link: link}, layout: false
      # redirect_to root_path
    else
      flash.now[:error] = 'Link not created'
      render root_path
      # redirect_to root_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    # binding.pry
    link = Link.find(params[:id])
    link.update(link_params)
    if link.save
      flash[:success] = "Link updated successfully"
      # render root_path
      redirect_to root_path
    else
      flash[:notice] = 'Link not updated'
      # render root_path
      redirect_to edit_link_path(link)
    end
  end

  private
  def link_params
    params.require(:link).permit(:url, :title)
  end
end
