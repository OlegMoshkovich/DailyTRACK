class AddImageToDailyReports < ActiveRecord::Migration
  def self.up
    add_attachment :daily_reports, :image
  end

  def self.down
    remove_attachment :daily_reports, :image
  end

end
