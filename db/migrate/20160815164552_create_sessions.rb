class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.string :author
      t.text :notes
      t.integer :reps
      t.integer :sets
      t.integer :weight
      t.references :workout, foreign_key: true

      t.timestamps
    end
  end
end
