class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :ename
      t.integer :sort, :default => 0

      t.timestamps
    end
  end
end
