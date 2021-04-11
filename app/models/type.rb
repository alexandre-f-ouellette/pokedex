# == Schema Information
#
# Table name: types
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Type < ApplicationRecord
  has_many :pokemon_type
  has_many :pokemon, through: :pokemon_type
end
