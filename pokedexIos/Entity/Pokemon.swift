//
//  Pokemon.swift
//  pokedexIos
//
//  Created by Lexo on 24/03/2021.
//

import Foundation
import PokemonAPI

struct Pokemon {
    let pokemon: PKMPokemon
    
    init?(pokemon: PKMPokemon) {
        self.pokemon = pokemon
    }
}
