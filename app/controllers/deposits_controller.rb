class DepositsController < ApplicationController
  def new
    @deposit = Deposit.new
  end

  # def create
  #   @deposit = Deposit.new(deposit_params)
  #   @deposit.save
  # end

  private

  def deposit_params
    params.require(:deposit).permit(:state, :amount)
  end
end
