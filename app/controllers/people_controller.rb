class PeopleController < ApplicationController
  before_action :set_person, only: %i[ update destroy ]
  before_action :valid_csv_file, only: %i[ import ]

  # GET /people or /people.json
  def index
    @people = Person.all
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.js {}
        format.html { redirect_to people_url, notice: "Person #{@person.first_name} was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.js {}
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.js {}
        format.html { redirect_to people_url, notice: "Person #{@person.first_name} was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.js {}
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person #{@person.first_name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import
    @import = PeopleImport.new(params[:file])

    if @import.save
     redirect_to people_url, notice: "CSV data imported!"
    else
      @records = @import.invalid_records
      if @records.empty? 
        redirect_to people_url
      else
        render 'form_create'
      end
    end
  end

  def update_multiple

    people = params[:people]
    people.map do |person|
       record = Person.new
       record.errors.clear
       record.first_name = person.values[0]
       record.last_name = person.values[1]
       record.email = person.values[2]
       record.phone = person.values[3]
       record.save
    end
    redirect_to people_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :email, :phone)
    end

    # Only allow valid csv files
    def valid_csv_file
      if params[:file].nil?
        flash[:notice] = "No File Uploaded!"
        redirect_to people_url
      elsif params[:file].content_type != 'text/csv'
        flash[:notice] = "File type must be csv: #{params[:file].original_filename}"
        redirect_to people_url
      end
    end
end
