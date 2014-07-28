class NotesController < ApplicationController

	def create
    	@inspection_report = InspectionReport.find(params[:inspection_report_id])
    	@note = @inspection_report.notes.create(note_params)#automatically associates the inspeciton to the report
    	redirect_to inspection_report_path(@inspection_report)
  	end

  	def show
    	@inspection_report = InspectionReport.find(params[:inspection_report_id])
    	@note = @inspection_report.notes.find(params[:id])
  	end

  	def destroy
    	@inspection_report = InspectionReport.find(params[:inspection_report_id])
    	@note = @inspection_report.notes.find(params[:id])
    	@note.destroy
    	redirect_to inspection_report_path(@inspection_report)
  	end

  	 	def edit
    	@inspection_report = InspectionReport.find(params[:inspection_report_id])
    	@note = @inspection_report.notes.find(params[:id])
  	end

private
    def note_params
      params.require(:note).permit(:observation)
    end
end
