class AddInspectorToInspections < ActiveRecord::Migration
  def change
    add_column :inspections, :inspector, :string
  end
end
