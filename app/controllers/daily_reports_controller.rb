class DailyReportsController < ApplicationController
before_action :authenticate_user!
	
	def index

    # TODO provide a date for the view 
    # lookup inspections associated

    # handle no inspections / daily report for the selected date

    @date = Date.today

   # binding.pry
    @daily_report= DailyReport.find_by_date(@date)
    @walls = @daily_report.inspections.where("element = ?", "WALL").order(created_at: :asc) 
    @slabs = @daily_report.inspections.where("element = ?", "SLAB").order(created_at: :asc) 
  	# @walls = Inspection.where(created_at: (Time.now.midnight)..Time.now).order(created_at: :asc).where("element = ?", "WALL")
  	# @slabs = Inspection.where(created_at: (Time.now.midnight)..Time.now).order(created_at: :asc).where("element = ?", "SLAB")
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
  def destroy
      @observation = @daily_report.observations.find(params[:id])
      @observation.destroy
      redirect_to daily_reports_path 
    end
	
	private

  	def daily_reports_params
    	params.require(:daily_report).permit(:narrative, :date)
  	end

end
