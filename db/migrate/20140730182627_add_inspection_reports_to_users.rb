class AddInspectionReportsToUsers < ActiveRecord::Migration
  def change
  	add_reference :inspection_reports, :user, index: true
  end
end
