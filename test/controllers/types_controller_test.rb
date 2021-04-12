require 'test_helper'

class TypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type = Type.create(name: 'test')
  end

  test 'should get paginated index' do
    get '/types', as: :json

    assert_response :success

    assert_equal 3, response.parsed_body['data'].size
    assert_equal '3', response.headers['X-Total']
    assert_equal '1', response.headers['X-Page']
    assert_equal '25', response.headers['X-Per-Page']
  end

  test 'should create type' do
    assert_difference('Type.count') do
      post  types_url,
            params: {
              data: {
                type: 'type',
                attributes: {
                  name: 'Grass'
                }
              }
            },
            as: :json
    end

    assert_response 201
  end

  test 'should return an error when creating a type without a name' do
    assert_no_difference('Type.count') do
      post  types_url,
            params: {
              data: {
                type: 'type',
                attributes: {
                  name: ''
                }
              }
            },
            as: :json
    end

    assert_response 422
    assert_includes response.parsed_body.keys, 'name'
    assert_equal ["can't be blank"], response.parsed_body['name']
  end

  test 'should show type' do
    get type_url(@type), as: :json
    assert_response :success
    assert_equal @type.id, response.parsed_body.dig('data', 'id')
  end

  test 'should update type' do
    patch type_url(@type),
          params: {
            data: {
              type: 'type',
              attributes: {
                name: 'Grass'
              }
            }
          },
          as: :json

    assert_response 200
    assert_equal 'Grass', response.parsed_body.dig('data', 'attributes', 'name')
  end

  test 'should destroy type' do
    assert_difference('Type.count', -1) do
      delete type_url(@type), as: :json
    end

    assert_response 204
  end
end
