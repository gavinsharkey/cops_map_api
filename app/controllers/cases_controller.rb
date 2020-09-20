class CasesController < ApplicationController
  def index
    @cases = Case.by_incident(params[:incident_id])
    render json: @cases, methods: [:media_url]
  end

  def create
    @case = Case.new(case_params)
    if @case.save
      render json: @case, methods: [:media_url]
    else
      render json: { errors: @case.errors.full_messages }
    end
  end

  private

  def case_params
    params.require(:case).permit(:title, :description, :incident_id, :media)
  end
end