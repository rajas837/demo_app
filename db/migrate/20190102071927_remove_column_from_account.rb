class RemoveColumnFromAccount < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :belongs_to, :string
  end
end
