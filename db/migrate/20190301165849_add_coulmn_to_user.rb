class AddCoulmnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :braintree_customer_id, :integer
  end
end
