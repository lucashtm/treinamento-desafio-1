class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.float :total
      t.string :payment_methods

      t.timestamps
    end
  end
end
