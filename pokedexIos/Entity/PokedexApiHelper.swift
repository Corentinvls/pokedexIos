//
//  PokedexApiHelper.swift
//  pokedexIos
//
//  Created by Lexo on 23/03/2021.
//

import Foundation
import PokemonAPI

class PokedexApiHelper {
    
    let pokemonApi = PokemonAPI()
    
    func getAllPokemon() -> Any {
        pokemonApi.pokemonService.fetchPokemonList(){
            result in
            switch result {
                case .success(let pokemons):
                    // okvf
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    break
            }
        }
    }
}
