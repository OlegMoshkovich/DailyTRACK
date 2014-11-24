class InspectionReportsController < ApplicationController
	before_action :authenticate_user!

	def index
		@inspection_reports = InspectionReport.where(:inspector => current_user.username)
		@user = current_user
		@inspection_report_current =InspectionReport.where(:inspector => current_user.username).last
		@user = current_user
	end

	def new
		@inspection_report = InspectionReport.new	
		@user = current_user
	end

	def show
  		@inspection_report = InspectionReport.find(params[:id])
		@user = current_user
	end

	def create	
  		@inspection_report = InspectionReport.new(inspection_report_params)
  		@inspection_report.inspector = current_user.username
  		@inspection_report.user = current_user
  		@user_a = current_user
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
    	params.require(:inspection_report).permit( :date)
  	end
end
