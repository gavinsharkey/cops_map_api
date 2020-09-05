class CasesController < ApplicationController
  def index
    @cases = Case.where(incident_id: params[:incident_id])
    render json: @cases
  end
end