class CreatePokemonTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_types, id: :uuid do |t|
      t.belongs_to :pokemon, type: :uuid
      t.belongs_to :type, type: :uuid

      t.timestamps
    end
  end
end
