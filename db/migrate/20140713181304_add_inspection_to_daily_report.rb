class AddInspectionToDailyReport < ActiveRecord::Migration
  def change
  	add_reference :inspections, :daily_report, index: true

  end
end
