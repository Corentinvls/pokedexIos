//
//  GameVersion.swift
//  pokedexIos
//
//  Created by Lexo on 24/03/2021.
//

import Foundation
import PokemonAPI


struct GameVersion {
    let gameVersion: PKMVersion
    
    init?(gameVersion: PKMVersion) {
        self.gameVersion = gameVersion
    }
}
