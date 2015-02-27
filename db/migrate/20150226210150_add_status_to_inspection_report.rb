class AddStatusToInspectionReport < ActiveRecord::Migration
  def change
  	add_column :inspection_reports, :status, :string
  end
end

