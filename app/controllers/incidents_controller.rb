class IncidentsController < ApplicationController
  def index
    if params[:query].present?
      @incidents = Incident.search_by_title_user_or_state(params[:query])
    else
      @incidents = Incident.all
    end
  end
end
