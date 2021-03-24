//
//  GameVersion.swift
//  pokedexIos
//
//  Created by Lexo on 24/03/2021.
//

import Foundation
import PokemonAPI

struct GameVersionUrl {
    let gameVersionUrl: String
    
    init?(gameVersionUrl: PKMAPIResource<PKMVersion>) {
        self.gameVersionUrl = gameVersionUrl.url!
    }
}
