class LinksController < ApplicationController
  def index
    @links = current_user.links
  end

  def new
    @link = Link.new
  end

  def create

    slug = [*('a'..'z'), *('0'..'9')].shuffle[0,6].join

    @link = Link.new(user_id: current_user.id, slug: slug, target_url: params[:target_url])

    if @link.save
      flash[:success] = "Link Created - Your Short Link is http://localhost:3000/#{@link.slug}"
      redirect_to "/links"
    else
      render "new"
    end
  end

  def show
    @link = Link.find(params[:id])
    @visits = Visit.where(link_id: @link.id)
  end

end
