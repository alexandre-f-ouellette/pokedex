class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[show update destroy]

  # GET /pokemons
  def index
    @pokemons = paginate Pokemon.all

    render json: serialize_model(@pokemons)
  end

  # GET /pokemons/1
  def show
    render json: serialize_model(@pokemon)
  end

  # POST /pokemons
  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      render json: @pokemon, status: :created, location: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemons/1
  def update
    if @pokemon.update(pokemon_params)
      render json: serialize_model(@pokemon)
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pokemons/1
  def destroy
    @pokemon.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pokemon_params
    params.require(:pokemon).permit(:name, :number, :hp, :attack, :defence, :sp_attack, :sp_defence, :speed, :generation, :legendary, :deleted_at)
  end

  def serialize_model(data)
    PokemonSerializer.new(data).serializable_hash.to_json
  end
end
