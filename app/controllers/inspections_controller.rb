class InspectionsController < ApplicationController
  before_action :authenticate_user!

    def index  
      @inspections = Inspection.search_for(params[:q])
      @walls = Inspection.where(created_at: (Time.now.midnight)..Time.now).order(created_at: :asc).where("element = ?", "WALL")
      @slabs = Inspection.where(created_at: (Time.now.midnight)..Time.now).order(created_at: :asc).where("element = ?", "SLAB")
    end

    def create
      @inspection_report = InspectionReport.find(params[:inspection_report_id])
    	@inspection = @inspection_report.inspections.new(inspection_params)#automatically associates the inspeciton to the report
      @inspection.image = params["inspection"]["image"]
      @inspection.inspector = current_user.username
      @inspection.save
      redirect_to inspection_report_path(@inspection_report)
  	end

  	def show
      @inspections = Inspection.all	  
    	@inspection = @inspections.find(params[:id])
      @inspection_report_current =InspectionReport.where(:inspector => current_user.username).last
    end

  	def destroy
    	@inspection_report = InspectionReport.find(params[:inspection_report_id])
    	@inspection = @inspection_report.inspections.find(params[:id])
    	@inspection.destroy
    	redirect_to inspection_report_path(@inspection_report)
  	end
 
 	  def edit
      @inspection_report_current =InspectionReport.where(:inspector => current_user.username).last
      @inspections = Inspection.all 
    	@inspection = @inspections.find(params[:id])
  	end

      def update
        @inspection = Inspection.find params[:id]
        respond_to do |format|
      if @inspection.update(inspection_params)
        format.html { redirect_to @inspection, notice: 'Inspection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @inspeciton.errors, status: :unprocessable_entity }
      end
    end
  end

private
    def inspection_report_params
      params.require(:inspection_report).permit( :date)
    end
    def inspection_params
      params.require(:inspection).permit(:heading, :element, :start, :finish, :operation, :scope, :note, :image )
    end
end
