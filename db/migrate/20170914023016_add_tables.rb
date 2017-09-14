class AddTables < ActiveRecord::Migration[5.0]
	def change
		create_table :monsters do |t|
			t.string :name
			t.timestamps
		end

		create_table :drops do |t|
			t.string :name
			t.timestamps
		end

		create_table :monster_drops do |t|
			t.belongs_to :monster
			t.belongs_to :drop
			t.timestamps
		end

		create_table :records do |t|
			t.belongs_to :monster
			t.string :uploader
			t.timestamps
		end

		create_table :monster_drop_records do |t|
			t.belongs_to :monster_drop
			t.belongs_to :record
			t.integer :count
			t.timestamps
		end
	end
end
