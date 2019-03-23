class AddColumnToHistory < ActiveRecord::Migration[5.2]
  def change
    add_reference :histories, :account, foreign_key: true
  end
end
