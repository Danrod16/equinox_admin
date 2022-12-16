class IncidentsController < ApplicationController
  def index
    @incidents = Incident.all.paginate(page: params[:page], per_page: 15)
    @incidents = @incidents.search_by_title_user_or_state(params[:query]) if params[:query].present?

    if params[:user].present?
      @user = User.where("CONCAT(first_name, ' ', last_name) = ?", params[:user])
      @bookings = @bookings.where(user: @user)
    end

    @incidents = @incidents.where(title: params[:title]) if params[:title].present?
    @incidents = @incidents.where(state: params[:state]) if params[:state].present?
    @incidents = @incidents.where(booking_id: params[:booking]) if params[:booking].present?

    @incidents = @incidents.paginate(page: params[:page], per_page: 15)

    respond_to do |format|
      format.html
      format.text { render partial: 'shared/table_rows', locals: { headers: Incident::INCIDENT_HEADERS, records: @incidents }, formats: [:html] }
    end
  end

  def show
    @incident = Incident.find(params[:id])
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

  def edit
    @incident = Incident.find(params[:id])
  end

  def update
    @incident = Incident.find(params[:id])
    if @incident.update(incident_params)
      redirect_to incident_path(@incident)
    else
      render :edit
    end
  end

  private

  def incident_params
    params.require(:incident).permit(:booking_id, :user_id, :state, :title, :hourly_fee, :total_hours, :total_cost, :description, :photo)
  end
end
