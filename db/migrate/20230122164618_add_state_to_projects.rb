class AddStateToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :aasm_state, :string
    add_column :projects, :progress_in, :datetime
    add_column :projects, :completed_at, :datetime
  end
end
