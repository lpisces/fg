class AddSourceToItems < ActiveRecord::Migration
  def change
    add_column :items, :source, :string
    rename_column :items, :howto, :operate
    add_column :items, :start, :string 
    remove_column :items, :mimg
  end
end
