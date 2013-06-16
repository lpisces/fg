class FixItems < ActiveRecord::Migration
  def up
    remove_column :items, :target
    add_column :items, :target, :text

    remove_column :items, :operate
    add_column :items, :operate, :text

    remove_column :items, :desc
    add_column :items, :desc, :text

    remove_column :items, :start
    add_column :items, :start, :text
  end

  def down
    remove_column :items, :target
    add_column :items, :target, :string

    remove_column :items, :operate
    add_column :items, :operate, :string

    remove_column :items, :desc
    add_column :items, :desc, :string

    remove_column :items, :start
    add_column :items, :start, :string
  end

end
