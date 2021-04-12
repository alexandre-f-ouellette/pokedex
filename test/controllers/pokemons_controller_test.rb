require 'test_helper'

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pokemon = Pokemon.create(name: 'test', number: 123)
  end

  test 'should get paginated index' do
    get '/pokemons', as: :json

    assert_response :success

    assert_equal 1, response.parsed_body['data'].size
    assert_equal '1', response.headers['X-Total']
    assert_equal '1', response.headers['X-Page']
    assert_equal '25', response.headers['X-Per-Page']
  end

  test 'should create pokemon' do
    assert_difference('Pokemon.count') do
      post  pokemons_url,
            params: {
              data: {
                type: 'pokemon',
                attributes: {
                  name: 'Pokemang',
                  number: 1234
                }
              }
            },
            as: :json
    end

    assert_response 201
  end

  test 'should return an error when creating a pokemon without a name' do
    assert_no_difference('Pokemon.count') do
      post  pokemons_url,
            params: {
              data: {
                type: 'pokemon',
                attributes: {
                  number: 1234
                }
              }
            },
            as: :json
    end

    assert_response 422
    assert_includes response.parsed_body.keys, 'name'
    assert_equal ["can't be blank"], response.parsed_body['name']
  end

  test 'should show pokemon' do
    get pokemon_url(@pokemon), as: :json
    assert_response :success
    assert_equal @pokemon.id, response.parsed_body.dig('data', 'id')
  end

  test 'should update pokemon' do
    patch pokemon_url(@pokemon),
          params: {
            data: {
              type: 'pokemon',
              attributes: {
                name: 'Pokemang'
              }
            }
          },
          as: :json

    assert_response 200
    assert_equal 'Pokemang', response.parsed_body.dig('data', 'attributes', 'name')
  end

  test 'should destroy pokemon' do
    assert_difference('Pokemon.count', -1) do
      delete pokemon_url(@pokemon), as: :json
    end

    assert_response 204
  end
end
