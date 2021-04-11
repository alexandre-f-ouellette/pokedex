# == Schema Information
#
# Table name: types
#
#  id         :uuid             not null, primary key
#  deleted_at :datetime
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_types_on_deleted_at  (deleted_at)
#
class Type < ApplicationRecord
  acts_as_paranoid

  has_many :pokemon_type
  has_many :pokemon, through: :pokemon_type
end
