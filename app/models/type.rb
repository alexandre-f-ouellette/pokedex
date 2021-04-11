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
end
