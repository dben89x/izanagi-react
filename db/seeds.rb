unless Drop.any?
	Drop.create(name: "Bronze Bag")
	Drop.create(name: "Silver Bag")
	Drop.create(name: "Gold Bag")
	Drop.create(name: "Platinum Bag")
	Drop.create(name: "Hoarded Wealth")
	Drop.create(name: "Treasure Box Key")
	Drop.create(name: "Chick Egg Shells")
end

unless Monster.any?
	m = Monster.create(name: "Treasure Chick")
	Drop.all.each { |d| MonsterDrop.create(monster: m, drop: d) }
end

# First sample
record = Record.create(uploader: "Tubs", monster: m, sample_size: 105)
create_monster_drop_record(record, find_monster_drop("Bronze Bag"), 105)
create_monster_drop_record(record, find_monster_drop("Silver Bag"), 66)
create_monster_drop_record(record, find_monster_drop("Gold Bag"), 23)
create_monster_drop_record(record, find_monster_drop("Platinum Bag"), 4)
create_monster_drop_record(record, find_monster_drop("Hoarded Wealth"), 3)
create_monster_drop_record(record, find_monster_drop("Treasure Box Key"), 10)
create_monster_drop_record(record, find_monster_drop("Chick Egg Shells"), 26)

# Second sample
record = Record.create(uploader: "Tubs", monster: m, sample_size: 47)
create_monster_drop_record(record, find_monster_drop("Bronze Bag"), 47)
create_monster_drop_record(record, find_monster_drop("Silver Bag"), 31)
create_monster_drop_record(record, find_monster_drop("Gold Bag"), 10)
create_monster_drop_record(record, find_monster_drop("Platinum Bag"), 6)
create_monster_drop_record(record, find_monster_drop("Hoarded Wealth"), 1)
create_monster_drop_record(record, find_monster_drop("Treasure Box Key"), 6)
create_monster_drop_record(record, find_monster_drop("Chick Egg Shells"), 14)

# Third sample
record = Record.create(uploader: "Tubs", monster: m, sample_size: 33)
create_monster_drop_record(record, find_monster_drop("Bronze Bag"), 33)
create_monster_drop_record(record, find_monster_drop("Silver Bag"), 17)
create_monster_drop_record(record, find_monster_drop("Gold Bag"), 9)
create_monster_drop_record(record, find_monster_drop("Platinum Bag"), 2)
create_monster_drop_record(record, find_monster_drop("Hoarded Wealth"), 0)
create_monster_drop_record(record, find_monster_drop("Treasure Box Key"), 4)
create_monster_drop_record(record, find_monster_drop("Chick Egg Shells"), 9)


def find_monster_drop(name)
	MonsterDrop.joins(:drop).where(drops: { name: name } ).first
end

def create_monster_drop_record(record, monster_drop, count)
	MonsterDropRecord.create(monster_drop: monster_drop, record: record, count: count)
end
