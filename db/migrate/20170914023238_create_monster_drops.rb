class CreateMonsterDrops < ActiveRecord::Migration[5.0]
  def change
    create_table :monster_drops do |t|

      t.timestamps
    end
  end
end
