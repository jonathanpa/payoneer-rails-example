class AddBalanceToPayees < ActiveRecord::Migration
  def change
    change_table :payees do |t|
      t.float :balance, default: 0.0
    end
  end
end
