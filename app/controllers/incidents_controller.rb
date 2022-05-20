class IncidentsController < ApplicationController
  def index
    if params[:query].present?
      @incidents = Incident.search_by_title_user_or_state(params[:query])
    else
      @incidents = Incident.all
    end
  end

  def new
    @incident = Incident.new
  end

  def create
    @incident = Incident.new(incident_params)
    if @incident.save
      redirect_to incidents_path
    else
      render :new
    end
  end

  private

  def incident_params
    params.require(:incident).permit(:booking_id, :user_id, :state, :title, :hourly_fee, :total_hours, :total_cost, :description, :photo)
  end
end
