class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :name
      t.string :belongs
      t.integer :gender
      t.boolean :subscribed, default: false
      t.timestamps
    end
  end
end
