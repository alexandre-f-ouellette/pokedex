class AddDeletedAtToTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :types, :deleted_at, :datetime
  end
end