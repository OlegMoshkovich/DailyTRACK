class AddNoteToInspections < ActiveRecord::Migration
  def change
  	add_column :inspections, :note, :string
  end
end
