class AddPlayLinkToItems < ActiveRecord::Migration
  def change
    add_column :items, :play_link, :string
  end
end
