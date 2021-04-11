class CreatePokemonTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_types, id: :uuid do |t|
      t.belongs_to :pokemon
      t.belongs_to :type

      t.timestamps
    end
  end
end
