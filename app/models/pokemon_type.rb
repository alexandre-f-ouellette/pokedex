# == Schema Information
#
# Table name: pokemon_types
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pokemon_id :bigint
#  type_id    :bigint
#
# Indexes
#
#  index_pokemon_types_on_pokemon_id  (pokemon_id)
#  index_pokemon_types_on_type_id     (type_id)
#
class PokemonType < ApplicationRecord
  belongs_to :pokemon
  belongs_to :type
end
