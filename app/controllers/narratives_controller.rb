class NarrativesController < ApplicationController
	
	def create
    	@daily_report = DailyReport.find(params[:daily_report_id])
    	@narrative = @daily_report.narratives.create(narrative_params)#automatically associates the inspeciton to the report
    	redirect_to daily_report_path(@daily_report)
  	end
  	
  	def destroy
    	@daily_report = DailyReport.find(params[:daily_report_id])
    	@narrative = @daily_report.narratives.find(params[:id])
    	@narrative.destroy
    	redirect_to daily_report_path(@daily_report)
  	end


private
    def narrative_params
      params.require(:narrative).permit(:narrative)
    end
end