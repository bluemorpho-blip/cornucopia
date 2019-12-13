class AddCornucopiaIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :cornucopia_id, :integer
  end
end
