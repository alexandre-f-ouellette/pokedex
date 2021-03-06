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
class Pokemon < ApplicationRecord
  acts_as_paranoid

  validates_presence_of :name, :number

  has_many :pokemon_type
  has_many :types, through: :pokemon_type

  def total
    hp.to_i +
      attack.to_i +
      defence.to_i +
      sp_attack.to_i +
      sp_defence.to_i +
      speed.to_i
  end
end
