class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
 		t.string :heading
      	t.string :element
      	t.string :start
      	t.string :finish
      	t.string :operation
      	t.references :inspection_report, index: true


      t.timestamps
    end
  end
end
