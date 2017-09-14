class AddSampleSizeToRecords < ActiveRecord::Migration[5.0]
	def change
		add_column :records, :sample_size, :integer
	end
end
