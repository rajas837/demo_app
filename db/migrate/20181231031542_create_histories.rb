class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string :transaction_history
      t.string :description

      t.timestamps
    end
  end
end
