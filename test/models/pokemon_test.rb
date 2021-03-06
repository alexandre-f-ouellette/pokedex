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
require 'test_helper'

class PokemonTest < ActiveSupport::TestCase
  test 'pokemon requires a name' do
    pokemon = Pokemon.new(number: 123)

    assert_not pokemon.valid?
    pokemon.errors.of_kind? :name, :blank
  end

  test 'pokemon requires a number' do
    pokemon = Pokemon.new(name: 'Pokemanz')

    assert_not pokemon.valid?
    pokemon.errors.of_kind? :number, :blank
  end

  test 'total should be the sum of all attributes' do
    pokemon = pokemons(:one)

    assert_equal 60, pokemon.total
  end
end
