class CreateForces < ActiveRecord::Migration
  def change
    create_table :forces do |t|
      t.string :heading
      t.string :union147
      t.string :union15
      t.string :union14
      t.string :union731
      t.string :union3

      t.references :inspection_report, index: true

      t.timestamps
    end
  end
end
