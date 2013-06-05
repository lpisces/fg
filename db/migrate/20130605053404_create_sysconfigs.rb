class CreateSysconfigs < ActiveRecord::Migration
  def change
    create_table :sysconfigs do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
