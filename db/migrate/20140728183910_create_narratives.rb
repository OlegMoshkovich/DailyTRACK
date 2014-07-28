class CreateNarratives < ActiveRecord::Migration
  def change
    create_table :narratives do |t|
 		t.string :narrative
      	t.references :daily_report, index: true
      t.timestamps
    end
  end
end
