class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :code
      t.timestamps null: false
    end

    change_table :payees do |t|
      t.references :currency
    end
  end
end
