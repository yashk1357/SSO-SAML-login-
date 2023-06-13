class CreateChannleMixes < ActiveRecord::Migration[7.0]
  def change
    create_table :channle_mixes do |t|
      t.string :name
      t.references :objective

      t.timestamps
    end
  end
end
