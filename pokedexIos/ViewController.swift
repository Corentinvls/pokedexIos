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
            print(pokemons)
            for pokemon in pokemons{
                if let abilities = pokemon["abilities"] as? [[String: AnyObject]] {
                    
                    for abililite in abilities{
                        print(abililite)
                    }
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
