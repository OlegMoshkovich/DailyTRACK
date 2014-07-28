class InspectionReportsController < ApplicationController
	before_action :authenticate_user!

	def index
		@inspection_reports = InspectionReport.all
	end

	def new
		@inspection_report = InspectionReport.new	
	end

	def show
  		@inspection_report = InspectionReport.find(params[:id])
	end

	def create
  		@inspection_report = InspectionReport.new(inspection_report_params)
  		if @inspection_report.save
  			redirect_to @inspection_report 
  		else
  			render 'new'
  		end
	end

	def destroy
		@inspection_report = InspectionReport.find(params[:id])
		@inspection_report.destroy
		redirect_to inspection_reports_path	
	end


	private
  	def inspection_report_params
    	params.require(:inspection_report).permit(:inspector, :date)
  	end
end
