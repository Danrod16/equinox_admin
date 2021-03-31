class StatisticsController < ApplicationController
  def index
    authorize :statistics, :index?
  end
end
