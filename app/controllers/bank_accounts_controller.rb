class BankAccountsController < ApplicationController

  def index
    @bank_accounts = current_user.bank_accounts.order(:name)
  end

  def new
    @bank_account = current_user.bank_accounts.new
  end

  def create
    @bank_account = current_user.bank_accounts.new bank_account_params

    if @bank_account.save
      redirect_to bank_accounts_path
    else
      render :new
    end
  end

  def edit
    @bank_account = current_user.bank_accounts.find params.require(:id)

    respond_to :html
  end

  def update
    @bank_account = current_user.bank_accounts.find params.require(:id)

    if @bank_account.update bank_account_params
      redirect_to bank_accounts_path
    else
      render :edit
    end
  end

  private

  def bank_account_params
    params.require(:bank_account).permit(:name, :active)
  end
end
