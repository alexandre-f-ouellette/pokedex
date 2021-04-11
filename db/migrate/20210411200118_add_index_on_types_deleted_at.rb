class AddIndexOnTypesDeletedAt < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :types, :deleted_at, algorithm: :concurrently
  end
end
