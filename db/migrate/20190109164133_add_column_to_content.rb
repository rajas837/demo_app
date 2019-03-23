class AddColumnToContent < ActiveRecord::Migration[5.2]
  def change
    add_reference :contents, :article, foreign_key: true
  end
end
