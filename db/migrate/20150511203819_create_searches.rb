class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :userName
      t.string :tweet

      t.timestamps null: false
    end
  end
end
