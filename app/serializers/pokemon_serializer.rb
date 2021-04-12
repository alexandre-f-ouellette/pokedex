# == Schema Information
#
# Table name: pokemons
#
#  id         :uuid             not null, primary key
#  attack     :integer
#  defence    :integer
#  deleted_at :datetime
#  generation :integer
#  hp         :integer
#  legendary  :boolean
#  name       :string
#  number     :integer
#  sp_attack  :integer
#  sp_defence :integer
#  speed      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_pokemons_on_deleted_at  (deleted_at)
#
class PokemonSerializer < BaseSerializer
  include JSONAPI::Serializer

  attributes  :attack,
              :defence,
              :generation,
              :hp,
              :legendary,
              :name,
              :number,
              :sp_attack,
              :sp_defence,
              :speed,
              :created_at,
              :updated_at

  attribute :total, &:total

  has_many :types
end
