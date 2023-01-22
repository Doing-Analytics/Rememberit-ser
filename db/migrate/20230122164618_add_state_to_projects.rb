class AddStateToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :aasm_state, :string
  end
end
