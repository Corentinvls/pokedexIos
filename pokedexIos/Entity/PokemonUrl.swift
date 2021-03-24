//
//  PokemonUrl.swift
//  pokedexIos
//
//  Created by Lexo on 24/03/2021.
//

import Foundation
import PokemonAPI

struct PokemonUrl {
    let url: String
    
    init?(pokemon: PKMAPIResource<PKMPokemon>) {
        self.url = pokemon.url!
    }
}
