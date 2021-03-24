//
//  ViewController.swift
//  pokedexIos
//
//  Created by Corentin Vallois on 23/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PokedexApiHelper.shared.getAllPokemon {
            (pokemons, error) in
            for pokemon in pokemons {
                PokedexApiHelper.shared.callUrl(url: pokemon.url) {
                    (data, error) in
                    print(data["name"]!)
                }
            }
            
            /*
             PokedexApiHelper.shared.callUrl(
             url:"https://pokeapi.co/api/v2/pokemon/16/") {
             (data, error) in
             print(data["name"])
             }*/
        }
    }
    
    
}
