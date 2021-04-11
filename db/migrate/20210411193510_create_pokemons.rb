class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons, id: :uuid do |t|
      t.string :name
      t.integer :number
      t.integer :hp
      t.integer :attack
      t.integer :defence
      t.integer :sp_attack
      t.integer :sp_defence
      t.integer :speed
      t.integer :generation
      t.boolean :legendary
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :pokemons, :deleted_at
  end
end
