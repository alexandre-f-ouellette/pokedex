require "test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pokemon = pokemons(:one)
  end

  test "should get index" do
    get pokemons_url, as: :json
    assert_response :success
  end

  test "should create pokemon" do
    assert_difference('Pokemon.count') do
      post pokemons_url, params: { pokemon: { attack: @pokemon.attack, defence: @pokemon.defence, deleted_at: @pokemon.deleted_at, generation: @pokemon.generation, hp: @pokemon.hp, legendary: @pokemon.legendary, name: @pokemon.name, number: @pokemon.number, sp_attack: @pokemon.sp_attack, sp_defence: @pokemon.sp_defence, speed: @pokemon.speed } }, as: :json
    end

    assert_response 201
  end

  test "should show pokemon" do
    get pokemon_url(@pokemon), as: :json
    assert_response :success
  end

  test "should update pokemon" do
    patch pokemon_url(@pokemon), params: { pokemon: { attack: @pokemon.attack, defence: @pokemon.defence, deleted_at: @pokemon.deleted_at, generation: @pokemon.generation, hp: @pokemon.hp, legendary: @pokemon.legendary, name: @pokemon.name, number: @pokemon.number, sp_attack: @pokemon.sp_attack, sp_defence: @pokemon.sp_defence, speed: @pokemon.speed } }, as: :json
    assert_response 200
  end

  test "should destroy pokemon" do
    assert_difference('Pokemon.count', -1) do
      delete pokemon_url(@pokemon), as: :json
    end

    assert_response 204
  end
end
