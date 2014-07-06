class ProjectDashboardsController < ApplicationController
	def index
		@concrete_summaries = ConcreteSummary.all
	end

	def new 
	end
	
	def import
		ConcreteSummary.import(params[:file])
		redirect_to :back, notice: "Summary uploaded"
	end

	def destroy
		@concrete_summaries = ConcreteSummary.all
		@concrete_summaries.delete_all
		redirect_to :back, notice: "Records PURGED"
	end
end
