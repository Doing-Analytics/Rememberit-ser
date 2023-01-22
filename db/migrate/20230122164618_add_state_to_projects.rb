class AddStateToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :state, :string
    add_column :projects, :started_at, :datetime
    add_column :projects, :completed_at, :datetime
  end
end
