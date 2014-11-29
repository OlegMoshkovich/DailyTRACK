class ForcesController < ApplicationController

    def create
      @inspection_report = InspectionReport.find(params[:inspection_report_id])
      @force = @inspection_report.forces.create(force_params)#automatically associates the inspeciton to the report
      redirect_to inspection_report_path(@inspection_report)
    end

    def show
      @inspection_report = InspectionReport.find(params[:inspection_report_id])
      @force = @inspection_report.forces.find(params[:id])
    end

    def destroy
      @inspection_report = InspectionReport.find(params[:inspection_report_id])
      @force = @inspection_report.forces.find(params[:id])
      @force.destroy
      redirect_to inspection_report_path(@inspection_report)
    end

      def edit
      @inspection_report = InspectionReport.find(params[:inspection_report_id])
      @force = @inspection_report.forces.find(params[:id])
    end

private
def force_params
      params.require(:force).permit(:heading, :union147, :union15,:union14,:union731,:union3)
    end
end




