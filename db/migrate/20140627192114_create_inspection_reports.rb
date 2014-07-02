class CreateInspectionReports < ActiveRecord::Migration
  def change
    create_table :inspection_reports do |t|
      t.string :inspector
      t.date :date

      t.timestamps
    end
  end
end
