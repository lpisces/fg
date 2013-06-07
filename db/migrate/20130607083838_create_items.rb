class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :ename
      t.string :flash
      t.string :bimg
      t.string :mimg
      t.string :simg
      t.string :desc
      t.string :howto
      t.string :target
      t.string :size
      t.string :params

      t.timestamps
    end
  end
end
