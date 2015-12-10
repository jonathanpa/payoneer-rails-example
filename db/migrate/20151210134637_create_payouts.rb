class CreatePayouts < ActiveRecord::Migration
  def change
    create_table :payouts do |t|
      t.string :payment_id
      t.float :amount
      t.text :description
      t.string :response_code
      t.string :response_description
      t.references :payee, index: true, foreign_key: true
      t.references :currency, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
