class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
 		t.string :observation
      	t.references :inspection_report, index: true

      t.timestamps
    end
  end
end
