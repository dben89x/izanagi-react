class MonsterDropRecordsController < ApplicationController
  before_action :set_monster_drop_record, only: [:show, :edit, :update, :destroy]

  # GET /monster_drop_records
  # GET /monster_drop_records.json
  def index
    @monster_drop_records = MonsterDropRecord.all
  end

  # GET /monster_drop_records/1
  # GET /monster_drop_records/1.json
  def show
  end

  # GET /monster_drop_records/new
  def new
    @monster_drop_record = MonsterDropRecord.new
  end

  # GET /monster_drop_records/1/edit
  def edit
  end

  # POST /monster_drop_records
  # POST /monster_drop_records.json
  def create
    @monster_drop_record = MonsterDropRecord.new(monster_drop_record_params)

    respond_to do |format|
      if @monster_drop_record.save
        format.html { redirect_to @monster_drop_record, notice: 'Monster drop record was successfully created.' }
        format.json { render :show, status: :created, location: @monster_drop_record }
      else
        format.html { render :new }
        format.json { render json: @monster_drop_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_drop_records/1
  # PATCH/PUT /monster_drop_records/1.json
  def update
    respond_to do |format|
      if @monster_drop_record.update(monster_drop_record_params)
        format.html { redirect_to @monster_drop_record, notice: 'Monster drop record was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_drop_record }
      else
        format.html { render :edit }
        format.json { render json: @monster_drop_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_drop_records/1
  # DELETE /monster_drop_records/1.json
  def destroy
    @monster_drop_record.destroy
    respond_to do |format|
      format.html { redirect_to monster_drop_records_url, notice: 'Monster drop record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_drop_record
      @monster_drop_record = MonsterDropRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_drop_record_params
      params.require(:monster_drop_record).permit(:count)
    end
end
