class AddContractorToInspectionReport < ActiveRecord::Migration
  def change
  	add_column :inspection_reports, :contract, :String
    add_column :inspection_reports, :contractor, :String
    add_column :inspection_reports, :shift, :String
    add_column :inspection_reports, :timeStart, :String
    add_column :inspection_reports, :timeEnd, :String
  end
end
