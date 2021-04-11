# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

file = File.expand_path('./data/pokemon.csv', __dir__)

SmarterCSV.process(file).each do |pokemon_data|
  type1_string = pokemon_data.delete(:type_1)
  type2_string = pokemon_data.delete(:type_2)

  pokemon_data[:legendary] = pokemon_data[:legendary].downcase == 'true'

  pokemon = Pokemon.new(pokemon_data.except(:total))

  unless type1_string.nil?
    type1 = Type.where(name: type1_string).first_or_initialize
    pokemon.types << type1
  end

  unless type2_string.nil?
    type2 = Type.where(name: type2_string).first_or_initialize
    pokemon.types << type2
  end

  pokemon.save
end
