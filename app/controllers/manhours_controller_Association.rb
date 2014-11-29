class ManhoursController < ApplicationController

  def create
      @inspection_report = InspectionReport.find(params[:inspection_report_id])
      @manhour = @inspection_report.manhours.create(manhour_params)#automatically associates the inspeciton to the report
      
      redirect_to inspection_report_path(@inspection_report)
    end

    def show
      @inspection_report = InspectionReport.find(params[:inspection_report_id])
      @manhour = @inspection_report.manhours.find(params[:id])
    end

    def destroy
      @inspection_report = InspectionReport.find(params[:inspection_report_id])
      @manhour = @inspection_report.manhours.find(params[:id])
      @manhour.destroy
      redirect_to inspection_report_path(@inspection_report)
    end

      def edit
      @inspection_report = InspectionReport.find(params[:inspection_report_id])
      @manhour = @inspection_report.manhours.find(params[:id])
    end

private
def manhour_params
      params.require(:manhour).permit(:heading, :union147, :union15,:union14,:union731,:union3)
    end
end
