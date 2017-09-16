class AddingNoNull < ActiveRecord::Migration[5.0]
	def change
		change_column :records, :sample_size, :integer, default: 0, null: false
		change_column :monster_drop_records, :count, :integer, default: 0, null: false
	end
end
