module BankAccountHelper
  def bank_account_options_for_select options = {}
    options.reverse_merge id: nil

    bank_accounts = current_user.bank_accounts
    bank_accounts = bank_accounts.where("active IS TRUE OR id = :id", id: options[:id])
    bank_accounts.order(:name).pluck(:name, :id)
  end
end
