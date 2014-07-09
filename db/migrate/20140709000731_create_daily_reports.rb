class CreateDailyReports < ActiveRecord::Migration
  def change
    create_table :daily_reports do |t|
      t.string :narrative
      t.date :date

      t.timestamps
    end
  end
end
