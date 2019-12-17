class CreateCornucopias < ActiveRecord::Migration
  def change
    create_table :cornucopias do |t|
      t.string  :name
      t.integer :user_id
    end
  end
end
