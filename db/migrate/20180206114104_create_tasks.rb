class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :text, null: false
      t.boolean :done, null: false, default: false
      t.integer :priority
      t.datetime :deadline
      t.references :project, foreign_key:true
      t.timestamps
    end
  end
end
