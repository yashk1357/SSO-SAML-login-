class CreateBudget < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.references :objective, null: false, foreign_key: true
      t.references :radius, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
