class AddColsToUsersTable < ActiveRecord::Migration
  def change
    add_column(:users, :name, :string)
    add_column(:users, :settings, :string, default: "")
  end
end
