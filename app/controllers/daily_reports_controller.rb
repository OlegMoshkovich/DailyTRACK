class DailyReportsController < ApplicationController
before_action :authenticate_user!
	def index

		@inspections = Inspection.search_for(params[:q])
      @walls = Inspection.where(created_at: (Time.now.midnight)..Time.now).order(created_at: :asc).where("element = ?", "WALL")
      @slabs = Inspection.where(created_at: (Time.now.midnight)..Time.now).order(created_at: :asc).where("element = ?", "SLAB")

	end
end
