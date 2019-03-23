class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :bank_name
      t.string :branch_name
      t.string :description

      t.timestamps
    end
  end
end
