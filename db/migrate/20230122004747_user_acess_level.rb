class UserAcessLevel < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :access_level, :integer
  end
end
