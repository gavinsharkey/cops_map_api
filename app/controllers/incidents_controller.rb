class IncidentsController < ApplicationController
  def index
    @incidents = Incident.in_radius(params[:latitude], params[:longitude], params[:radius])
    render json: @incidents
  end
end