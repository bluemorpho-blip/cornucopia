class CreateCornucopias < ActiveRecord::Migration
  def change
    create_table :cornucopia do |t|
      t.string :name
    end
  end
end
