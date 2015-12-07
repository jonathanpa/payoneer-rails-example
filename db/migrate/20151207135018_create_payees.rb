class CreatePayees < ActiveRecord::Migration
  def change
    create_table :payees do |t|
      t.string :email
      t.string :signed_url

      t.timestamps null: false
    end
  end
end
