class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.string     :description , null: false, default: ""
      t.boolean    :flow_in     , null: false, default: true
      t.decimal    :amount      , precision: 13, scale: 2, default: 0
      t.decimal    :total       , precision: 13, scale: 2, default: 0
      t.datetime   :issue_at    , null: false
      t.datetime   :due_at      , null: false
      t.datetime   :paid_at     , null: false
      t.boolean    :paid        , null: false, default: false
      t.references :bank_account, null: false
      t.references :category
      t.references :user        , null: false

      t.timestamps null: false
    end

    add_foreign_key :operations, :bank_accounts, column: :bank_account_id
    add_foreign_key :operations, :categories   , column: :category_id
    add_foreign_key :operations, :users        , column: :user_id
  end
end
