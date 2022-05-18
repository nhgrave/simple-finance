class CreateBankAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_accounts do |t|
      t.references :user  , null: false
      t.string     :name  , null: false, default: ""
      t.boolean    :active, null: false, default: true

      t.timestamps null: false
    end

    add_foreign_key :bank_accounts, :users, column: :user_id
  end
end
