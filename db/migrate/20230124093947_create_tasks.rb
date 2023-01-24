class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name
      t.string :notes
      t.datetime :start_on
      t.datetime :due_on
      t.datetime :due_at
      t.integer :assignee
      t.string :status

      t.timestamps
    end
  end
end
