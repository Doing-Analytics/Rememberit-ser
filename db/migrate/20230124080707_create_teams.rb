class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name , null: false
      t.string :created_user,null: false
      t.string :created_system
      t.datetime :deleted_at
      t.string :updated_user
      t.string :updated_system

      t.timestamps
    end
  end
end
