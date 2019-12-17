class CreateCornucopias < ActiveRecord::Migration
  def change
    create_table :cornucopia do |t|
      t.string  :name
      t.integer :user_id
    end
  end
end
