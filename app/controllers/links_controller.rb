class LinksController < ApplicationController
  before_action :authorize
  def index

    @link = Link.new
    @links = current_user.links.reverse
    # if !current_user
    #   redirect_to login_path
    # else
    #   @link = Link.new
    #   @links = current_user.links.reverse
    # end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    link = Link.find(params[:id])
    link.update(link_params)
    if link.save
      flash[:success] = "Link updated successfully"
      redirect_to root_path
    else
      flash[:notice] = link.errors.full_messages.join(', ')
      redirect_to edit_link_path(link)
    end
  end

  private
  def link_params
    params.require(:link).permit(:url, :title)
  end
end
