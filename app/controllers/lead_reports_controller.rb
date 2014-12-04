class LeadReportsController < ApplicationController

  def index
    @daily_report= DailyReport.ensure_today  
    @inspections = @daily_report.inspections.order(created_at: :asc)  
    @walls = @daily_report.inspections.where("element = ?", "WALL").order(created_at: :asc) 
    @slabs = @daily_report.inspections.where("element = ?", "SLAB").order(created_at: :asc) 
    @arches = @daily_report.inspections.where("element = ?", "ARCH").order(created_at: :asc)  
    @user = current_user

		@oleg_reports = InspectionReport.where(:inspector => "OlegM").last
		@brian_reports = InspectionReport.where(:inspector => "Brian_s").last
		@howard_reports = InspectionReport.where(:inspector => "Howard_Y").last


		# where(:inspector => current_user.username)
		@users = User.all
		@oleg = @users[2].username
		@inspection_report_current =InspectionReport.where(:inspector => "Oleg_Mosh").last
		# @user = current_user

  end




end
