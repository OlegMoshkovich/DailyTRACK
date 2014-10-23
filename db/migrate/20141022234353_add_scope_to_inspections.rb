class AddScopeToInspections < ActiveRecord::Migration
  def change
    add_column :inspections, :scope, :string
  end
end
