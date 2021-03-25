//
//  ViewController.swift
//  pokedexIos
//
//  Created by Corentin Vallois on 23/03/2021.
//

import UIKit

class MainViewController: UITabBarController {
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
       

        PokedexApiHelper.shared.getAllPokemon {
            (pokemons, error) in
            for pokemon in pokemons {
                PokedexApiHelper.shared.callUrl(url: pokemon.url) {
                    (data, error) in
                }
            }
        }
        
        PokedexApiHelper.shared.getOnePokemonByName(pokeName: "bulbasaur") { (datas, error) in
            for data in datas {
            }
        }
        
    }


}

