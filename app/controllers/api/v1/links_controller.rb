class Api::V1::LinksController < ApplicationController

  def create
    user = current_user
    link = user.links.new(link_params)
    my_class = nil
    if link.save
      render partial: 'links/link', locals: {link: link, my_class: my_class}, layout: false
    else
      render json: {errors: link.errors.full_messages}
    end
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  # def link_params
  #   params.permit(:read)
  # end
  # def link_params
  #   params.require(:link).permit(:url, :title, :read)
  # end
  def link_params
    params.require(:link).permit(:url, :title, :read)
  end
end
