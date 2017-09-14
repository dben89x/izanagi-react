class MonsterDrop < ApplicationRecord
	belongs_to :drop
	belongs_to :monster
	
	has_many :monster_drop_records

	delegate :name, to: :drop
end
