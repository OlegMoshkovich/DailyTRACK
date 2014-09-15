class InspectionsController < ApplicationController
  before_action :authenticate_user!

   
    def index
      
      @inspections = Inspection.search_for(params[:q])
      @walls = Inspection.where(created_at: (Time.now.midnight)..Time.now).order(created_at: :asc).where("element = ?", "WALL")
      @slabs = Inspection.where(created_at: (Time.now.midnight)..Time.now).order(created_at: :asc).where("element = ?", "SLAB")

    end

    def create
    	
      @inspection_report = InspectionReport.find(params[:inspection_report_id])
    	@inspection = @inspection_report.inspections.new(inspection_params)#automatically associates the inspeciton to the report
      @inspection.image = params["inspection"]["image"]
      #binding.pry
      @inspection.save
      redirect_to inspection_report_path(@inspection_report)

  	end

  	def show
    	@inspection_report = InspectionReport.find(params[:inspection_report_id])
    	@inspection = @inspection_report.inspections.find(params[:id])

  	end

  	def destroy
    	@inspection_report = InspectionReport.find(params[:inspection_report_id])
    	@inspection = @inspection_report.inspections.find(params[:id])
    	@inspection.destroy
    	redirect_to inspection_report_path(@inspection_report)
  	end
 
 	  def edit
    	@inspection_report = InspectionReport.find(params[:inspection_report_id])
    	@inspection = @inspection_report.inspections.find(params[:id])
  	end

private
    def inspection_params
      params.require(:inspection).permit(:heading, :element, :start, :finish, :operation, :image )
    end


end
