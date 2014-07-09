class DailyReportsController < ApplicationController
before_action :authenticate_user!
	
	def index
		@inspections = Inspection.search_for(params[:q])
    	@walls = Inspection.where(created_at: (Time.now.midnight)..Time.now).order(created_at: :asc).where("element = ?", "WALL")
      	@slabs = Inspection.where(created_at: (Time.now.midnight)..Time.now).order(created_at: :asc).where("element = ?", "SLAB")
      	@daily_reports=DailyReport.all
      	@daily_report = DailyReport.new
      	
	end

	def new
		@daily_report = DailyReport.new
	end
	
	def create
    	@daily_report = DailyReport.new(daily_reports_params)#automatically associates the inspeciton to the report
  		if @daily_report.save
  			redirect_to daily_reports_path 
  		else
  			render 'new'
  		end
  	end

  	def show
    	@daily_report = DailyReport.find(params[:id])
  	end

	
	private

  	def daily_reports_params
    	params.require(:daily_report).permit(:narrative, :date)
  	end

end
