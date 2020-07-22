export const selectAllPokemon = (state) => {    // pokemon is an object
    return Object.values(state.entities.pokemon)
}