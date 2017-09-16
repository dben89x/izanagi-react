class ChangeColumnDefaults < ActiveRecord::Migration[5.0]
	def change
		change_column_default :records, :sample_size, 0
		change_column_default :monster_drop_records, :count, 0
	end
end
