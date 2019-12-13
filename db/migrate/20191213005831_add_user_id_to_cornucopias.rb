class AddUserIdToCornucopias < ActiveRecord::Migration
  def change
    add_column :cornucopia, :user_id, :integer
  end
end
