class CreateCornucopias < ActiveRecord::Migration
  def change
    create_table :cornucopias do |t|
      t.string :name
    end
  end
end
