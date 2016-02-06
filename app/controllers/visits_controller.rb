class VisitsController < ApplicationController

  def create
    @link = Link.find_by(slug: params[:slug])

    if @link
      @visit = Visit.create(link_id: @link.id, from: request.remote_ip)
      redirect_to "#{@link.target_url}"
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
