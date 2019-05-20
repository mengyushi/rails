class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.string :title
      t.text :url

      t.timestamps
    end
  end
end
