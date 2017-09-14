class CreateDrops < ActiveRecord::Migration[5.0]
  def change
    create_table :drops do |t|
      t.string :name

      t.timestamps
    end
  end
end
