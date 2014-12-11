class AddContractorToInspectionReport < ActiveRecord::Migration
  def change
  	add_column :inspection_reports, :contract, :string
    add_column :inspection_reports, :contractor, :string
    add_column :inspection_reports, :shift, :string
    add_column :inspection_reports, :timeStart, :string
    add_column :inspection_reports, :timeEnd, :string
  end
end
