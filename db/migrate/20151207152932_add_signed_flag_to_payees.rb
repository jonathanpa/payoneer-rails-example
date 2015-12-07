class AddSignedFlagToPayees < ActiveRecord::Migration
  def change
    change_table :payees do |t|
      t.boolean :signed, default: false
      t.string :return_tag
    end

    rename_column(:payees, :signed_url, :sign_up_url)
  end
end
