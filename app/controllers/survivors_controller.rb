class SurvivorsController < ApplicationController
  before_action :set_survivor, only: [:show, :update, :destroy, :report]


  # GET /survivors
  def index
    # Paginate
    page = params[:page] ? params[:page] : 1
    per_page = params[:per_page] ? params[:per_page] : Survivor.all.count
    @survivors = Survivor.all.order(:name).page(page).per(per_page)

    # Doing some query parameter
    filter_params(params).each do |key,value|
      @survivors = @survivors.public_send(key,value) if value.present?
    end

    # Seting response json fields
    params_fields = params[:fields] if params[:fields].present?
    response_fields = response_fields(params_fields)

    if @survivors.empty?
      response = {warning: "no survivors found"}
      render json: response
    else

      render json: @survivors, only: response_fields
    end
  end

  # GET /survivors/1
  def show
    render json: @survivor
  end

  # POST /survivors
  def create
    @survivor = Survivor.new(survivor_params)
    if @survivor.save
      render json: @survivor, status: :created, location: @survivor
    else
      response = {errors: @survivor.errors}
      render json: response, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /survivors/1
  def update
    if @survivor.update(update_params)
      render json: @survivor
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /survivors/1
  def destroy
    @survivor.destroy
  end

  #GET /survivors/1/report
  def report
    if @survivor.abducted
      response = {warning: 'Watchout, ' + @survivor.name + ' has been abducted already'}
      render json: response
    else
      @survivor.flags +=1
      @survivor.abducted = true if @survivor.flags>=3 
      if @survivor.save
        response = {message: @survivor.name }
        response[:message] += @survivor.abducted ? ' has been abducted!' : ' has ' + @survivor.flags.to_s + ' reports, keep him safe.'
        render json: response
      else
        render json: @survivor.errors, status: :unprocessable_entity
      end
    end
  end

  def statistics
    total_survivors = Survivor.all.count
    total_non_abducted = Survivor.non_abducted.count
    total_abducted = Survivor.abducted.count

    percentage_non_abducted = percentage(total_non_abducted,total_survivors)
    percentage_abducted = percentage(total_abducted,total_survivors)

    response={abducted: percentage_abducted, non_abducted: percentage_non_abducted}
    render json: response
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survivor
      begin
        @survivor = Survivor.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        response = {error: "Survivor not found."}
        render json: error, status: :not_found
      end
    end

    # Only allow a trusted parameter "white list" through.
    def survivor_params
      params.require(:survivor).permit(:name, :age, :gender, :latitude, :longitude, :flags, :abducted)
    end

    def filter_params(params)
      params.slice(:by_name, :age, :gender, :latitude, :longitude)
    end

    def update_params
      params.require(:survivor).permit(:latitude, :longitude)
    end

    def percentage(portion, total)
      percentage = (portion.to_f/total)*100
    end

    def response_fields(params_fields)
      unless params_fields.nil? || params_fields.empty?
        fields = ["id", "name", "age", "flags", "abducted", "gender", "latitude", "longitude", "created_at", "updated_at"]
        valid_fields = []
        params_fields.split(",").each do |v|
          if fields.include?(v.downcase) 
            valid_fields.push(v.downcase.to_sym)
          end
        end
      end
      return valid_fields
    end
end
