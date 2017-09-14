class Record < ApplicationRecord
	has_many :monster_drop_records
	belongs_to :monster
end
