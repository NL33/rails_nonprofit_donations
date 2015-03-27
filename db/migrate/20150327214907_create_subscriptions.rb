class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :nonprofit_id
      t.float :amount
      t.string :interval
      t.string :name
      t.string :currency
      t.string :stripeid
      t.timestamps null: false
    end
  end
end
