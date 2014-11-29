class CreateManhours < ActiveRecord::Migration
  def change
    create_table :manhours do |t|
      t.string :heading
      t.string :union147
      t.string :union15

      t.timestamps
    end
  end
end
