class IncidentsController < ApplicationController
  def index
    @incidents = Incident.in_radius(params[:latitude], params[:longitude], params[:radius])
    render json: @incidents
  end

  def create
    @incident = Incident.new(incident_params)
    if @incident.save
      render json: @incident, include: { cases: { methods: [:media_url] } }
    else
      render json: { errors: @incident.errors.full_messages }
    end
  end

  private

  def incident_params
    params.require(:incident).permit(:latitude, :longitude, :description, cases_attributes: [:title, :description, :media])
  end
end