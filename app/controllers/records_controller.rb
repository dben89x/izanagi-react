class RecordsController < ApplicationController
	before_action :set_record, only: [:show, :edit, :update, :destroy]
	skip_before_action :verify_authenticity_token

	# GET /records
	# GET /records.json
	def index
		@records = Record.all

		monster = Monster.find_by(name: "Treasure Chick")
		@available_drops = MonsterDrop.where(monster: monster)
			.collect{|md| md.drop}.pluck(:name)

		@averages = set_averages

	end

	# GET /records/1
	# GET /records/1.json
	def show
	end

	# GET /records/new
	def new
		@record = Record.new
		monster = Monster.find_by(name: "Treasure Chick")
		@available_drops = MonsterDrop.where(monster: monster)
			.collect{|md| md.drop}.pluck(:name)

		@averages = set_averages
	end

	# GET /records/1/edit
	def edit
	end

	# POST /records
	# POST /records.json
	def create
		json = params['json']
		@record = Record.new(record_params)

		monster = Monster.find_by(name: "Treasure Chick")
		@record.monster = monster
		@record.sample_size = json['Bronze Bag']

		respond_to do |format|
			if @record.save
				params['json'].each do |drop, count|
					md = find_monster_drop(drop)
					mdr = MonsterDropRecord.new(monster_drop: md, record: @record, count: count)
					puts "mdr: #{mdr.inspect}"
					mdr.save
				end
				format.html { redirect_to @record, notice: 'Record was successfully created.' }
				format.json { render :show, status: :created, location: @record }
			else
				format.html { render :new }
				format.json { render json: @record.errors.inspect, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /records/1
	# PATCH/PUT /records/1.json
	def update
		respond_to do |format|
			if @record.update(record_params)
				format.html { redirect_to @record, notice: 'Record was successfully updated.' }
				format.json { render :show, status: :ok, location: @record }
			else
				format.html { render :edit }
				format.json { render json: @record.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /records/1
	# DELETE /records/1.json
	def destroy
		@record.destroy
		respond_to do |format|
			format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_record
			@record = Record.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def record_params
			params.require(:record).permit(:uploader)
		end

		def find_monster_drop(name)
			MonsterDrop.joins(:drop).where(drops: { name: name } ).first
		end

		def set_averages
			@sample_sizes = Record.all.pluck(:sample_size)
			@sample_size_sum =  @sample_sizes.sum.to_f
			@average_sample_size = @sample_size_sum / @sample_sizes.size

			@available_drops.collect do |drop|
				drop_count = find_monster_drop(drop).monster_drop_records.pluck(:count).sum
				drop_ratio = drop_count / @sample_size_sum * 100
				{drop => {count: drop_count, ratio: drop_ratio}}
			end

		end
end
