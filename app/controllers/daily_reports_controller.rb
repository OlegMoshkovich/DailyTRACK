class DailyReportsController < ApplicationController
  before_action :authenticate_user!
	
	def index
    @daily_report= DailyReport.ensure_today    
    @walls = @daily_report.inspections.where("element = ?", "WALL").order(created_at: :asc) 
    @slabs = @daily_report.inspections.where("element = ?", "SLAB").order(created_at: :asc) 
    @arches = @daily_report.inspections.where("element = ?", "ARCH").order(created_at: :asc)  
    @user = current_user
  end  

	def new
		@daily_report = DailyReport.ensure_today
	end
	
	def create
      date_params = params['/daily_reports']
      #year = date_params["date(1i)"]
      #month = date_params["date(2i)"]
      #day = date_params["date(3i)"]
      #@date = Date.new(year.to_i, month.to_i, day.to_i)
      @daily_report = DailyReport.find_or_initialize_by_date(date_params)
      if @daily_report.save
  			redirect_to @daily_report 
  		else
  			render 'new'
  		end
  	end

  def show
    	@daily_report = DailyReport.find(params[:id])
      @walls = @daily_report.inspections.where("element = ?", "WALL").order(created_at: :asc) 
      @slabs = @daily_report.inspections.where("element = ?", "SLAB").order(created_at: :asc) 
      @arches = @daily_report.inspections.where("element = ?", "ARCH").order(created_at: :asc)
      @user = current_user
      
      respond_to do |format|
        format.html
        format.csv{send_data text: @walls.to_csv }
        format.xls
      end  	
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
