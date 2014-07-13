class ProjectDashboardsController < ApplicationController
	def index
		@concrete_summaries = ConcreteSummary.all
		length = @concrete_summaries.length
		@baseline_early_ind_arr = []
		binding.pry
		for i in 0..20
			@baseline_early_ind_arr.push(@concrete_summaries[i].baseline_early_ind)
		end
		#binding.pry
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
