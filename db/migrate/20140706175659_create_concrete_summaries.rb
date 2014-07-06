class CreateConcreteSummaries < ActiveRecord::Migration
  def change
    create_table :concrete_summaries do |t|
    	t.string :date
    	t.integer :baseline_early_ind
    	t.integer :baseline_early_cum
    	t.integer :baseline_late_ind
    	t.integer :baseline_late_cum

      t.timestamps
    end
  end
end
