class CreateProjectDashboards < ActiveRecord::Migration
  def change
    create_table :project_dashboards do |t|
    	t.string :contract
    	t.string :title
    	t.string :contractor
    	t.string :cm
    	t.string :scheduler

    	t.date :period_start
    	t.date :period_end
    	t.string :period_start




      t.timestamps
    end
  end
end
