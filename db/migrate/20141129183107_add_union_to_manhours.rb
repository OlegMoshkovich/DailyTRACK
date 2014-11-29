class AddUnionToManhours < ActiveRecord::Migration
  def change
    add_column :manhours, :union14, :string
    add_column :manhours, :union731, :string
    add_column :manhours, :union3, :string
  end
end
