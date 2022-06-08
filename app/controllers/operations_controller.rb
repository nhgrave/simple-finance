class OperationsController < ApplicationController

  def index
    @operations = current_user.operations.order(:paid_at)
  end

  def new
    today = Date.today

    @operation = current_user.operations.new issue_at: today, due_at: today, paid_at: today
  end

  def create
    @operation = current_user.operations.new operation_params

    if @operation.save
      redirect_to operations_path
    else
      render :new
    end
  end

  def edit
    @operation = current_user.operations.find params.require(:id)

    respond_to :html
  end

  def update
    @operation = current_user.operations.find params.require(:id)

    if @operation.update operation_params
      redirect_to operations_path
    else
      render :edit
    end
  end

  def destroy
    @operation = current_user.operations.find params.require(:id)

    @operation.destroy

    redirect_to operations_path
  end

  private

  def operation_params
    params.require(:operation).permit(:description, :flow_in, :amount, :issue_at, :due_at, :paid_at,
      :paid, :bank_account_id, :category_id)
  end
end
