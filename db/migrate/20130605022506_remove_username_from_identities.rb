class RemoveUsernameFromIdentities < ActiveRecord::Migration
  def up
    remove_column :identities, :username
  end

  def down
    add_column :identities, :username, :string
  end
end
