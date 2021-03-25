//
//  testPokemon.swift
//  pokedexIos
//
//  Created by Corentin Vallois on 25/03/2021.
//

import UIKit

class TestPokemon {
    
    var name: String?
    var imageUrl: String?
    var image: UIImage?
    var id: Int?
    var weight: Int?
    var height: Int?
    var defense: Int?
    var attack: Int?
    var description: String?
    var type: String?
    
    init?( dictionary: [String: AnyObject]) {
        
        if let id = dictionary["id"] as? Int {
            self.id = id
        }
        
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        
    }
}
