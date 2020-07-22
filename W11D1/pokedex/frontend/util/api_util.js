import { $CombinedState } from "redux"

export const fetchAllPokemon = () => {
  // debugger
  return $.ajax({
    method: 'GET',
    url: '/api/pokemon'
  })
}


export const fetchOnePokemon = id => {
  return $.ajax({
    method: 'GET',
    url: `/api/pokemon/${id}`

  })
}