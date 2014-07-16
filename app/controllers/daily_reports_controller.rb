class DailyReportsController < ApplicationController
before_action :authenticate_user!
	
	def index

#binding.pry
    
    # TODO provide a date for the view 
    # lookup inspections associated

    # handle no inspections / daily report for the selected date
    
    @daily_report= DailyReport.ensure_today
    
    @walls = @daily_report.inspections.where("element = ?", "WALL").order(created_at: :asc) 
    @slabs = @daily_report.inspections.where("element = ?", "SLAB").order(created_at: :asc) 
  	# @walls = Inspection.where(created_at: (Time.now.midnight)..Time.now).order(created_at: :asc).where("element = ?", "WALL")
  	# @slabs = Inspection.where(created_at: (Time.now.midnight)..Time.now).order(created_at: :asc).where("element = ?", "SLAB")
	end

	def new
		@daily_report = DailyReport.ensure_today

	end
	
	def create
      date_params = params['/daily_reports']
      year = date_params["date(1i)"]
      month = date_params["date(2i)"]
      day = date_params["date(3i)"]

      @date = Date.new(year.to_i, month.to_i, day.to_i)

      # @permission = Permission.find_or_create_by_user_id_and_role_id_and_creator_id(@user.id, 2, current_user.id)

      @daily_report = DailyReport.find_or_initialize_by_date(@date)

     # binding.pry  		
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
