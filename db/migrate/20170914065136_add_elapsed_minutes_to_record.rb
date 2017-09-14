class AddElapsedMinutesToRecord < ActiveRecord::Migration[5.0]
	def change
		add_column :records, :elapsed_minutes, :integer
	end
end
