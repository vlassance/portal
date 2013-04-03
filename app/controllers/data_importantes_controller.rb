class DataImportantesController < ApplicationController
  # GET /data_importantes
  # GET /data_importantes.json
  def index
    @data_importantes = DataImportante.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @data_importantes }
    end
  end

  # GET /data_importantes/1
  # GET /data_importantes/1.json
  def show
    @data_importante = DataImportante.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @data_importante }
    end
  end

  # GET /data_importantes/new
  # GET /data_importantes/new.json
  def new
    @data_importante = DataImportante.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @data_importante }
    end
  end

  # GET /data_importantes/1/edit
  def edit
    @data_importante = DataImportante.find(params[:id])
  end

  # POST /data_importantes
  # POST /data_importantes.json
  def create
    @data_importante = DataImportante.new(params[:data_importante])

    respond_to do |format|
      if @data_importante.save
        format.html { redirect_to @data_importante, notice: 'Data importante was successfully created.' }
        format.json { render json: @data_importante, status: :created, location: @data_importante }
      else
        format.html { render action: "new" }
        format.json { render json: @data_importante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /data_importantes/1
  # PUT /data_importantes/1.json
  def update
    @data_importante = DataImportante.find(params[:id])

    respond_to do |format|
      if @data_importante.update_attributes(params[:data_importante])
        format.html { redirect_to @data_importante, notice: 'Data importante was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @data_importante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_importantes/1
  # DELETE /data_importantes/1.json
  def destroy
    @data_importante = DataImportante.find(params[:id])
    @data_importante.destroy

    respond_to do |format|
      format.html { redirect_to data_importantes_url }
      format.json { head :no_content }
    end
  end
end
