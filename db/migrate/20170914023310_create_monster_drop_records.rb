class CreateMonsterDropRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :monster_drop_records do |t|
      t.integer :count

      t.timestamps
    end
  end
end
