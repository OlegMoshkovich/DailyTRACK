class InspectionsController < ApplicationController

    def create
    	@inspection_report = InspectionReport.find(params[:inspection_report_id])
    	@inspection = @inspection_report.inspections.create(inspection_params)#automatically associates the inspeciton to the report
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
      params.require(:inspection).permit(:heading, :element, :start, :finish, :operation )
    end


end
