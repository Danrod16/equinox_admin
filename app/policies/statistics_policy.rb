class StatisticsPolicy < Struct.new(:user, :statistics)
  def index?
    user.admin?
  end
end 