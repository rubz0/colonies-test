class CreateStays < ActiveRecord::Migration[5.1]
  def change
    create_table :stays do |t|
      t.references :tenant, foreign_key: true
      t.references :studio, foreign_key: true
      t.date :starts_at
      t.date :ends_at

      t.timestamps
    end
  end
end
