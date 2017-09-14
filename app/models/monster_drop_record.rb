class MonsterDropRecord < ApplicationRecord
	belongs_to :monster_drop
	belongs_to :record

	delegate :name, to: :monster_drop
	has_one :drop, through: :monster_drop
end
