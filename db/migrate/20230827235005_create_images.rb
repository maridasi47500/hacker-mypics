class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.integer :hack_id
      t.integer :user_id
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
