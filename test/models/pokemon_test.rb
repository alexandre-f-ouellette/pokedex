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
require "test_helper"

class PokemonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
