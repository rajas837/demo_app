class RenameColumnOfHistoriesFromTransactionHistoryToAccBalance < ActiveRecord::Migration[5.2]
  def change
    rename_column :histories, :transaction_history, :acc_balance
  end
end
