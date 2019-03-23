class RenameColumnOfHistoriesFromTransactionHistoryToBalance < ActiveRecord::Migration[5.2]
  def change
    rename_column :histories, :transaction_history, :balance
  end
end
