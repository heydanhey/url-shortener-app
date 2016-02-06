class LinksController < ApplicationController
  
  before_action :authenticate_user!
  before_action :authenticate_owner!, only: [:edit, :update, :destroy, :show]

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

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.update(user_id: current_user.id, slug: params[:slug], target_url: params[:target_url])
  end

end
