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
class TypeSerializer < BaseSerializer
  include JSONAPI::Serializer

  attributes  :name,
              :created_at,
              :updated_at

  attribute :pokemon_count, &:pokemon_count
end
