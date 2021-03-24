//
//  TypeUrl.swift
//  pokedexIos
//
//  Created by Lexo on 24/03/2021.
//

import Foundation
import PokemonAPI

struct TypeUrl {
    let url: String
    
    init?(type: PKMAPIResource<PKMType>) {
        self.url = type.url!
    }
}
