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
        PokedexApiHelper.shared.getAllPokemon { (pokemons, error) in
            print(pokemons)
        }
        
        PokedexApiHelper.shared.test(
            url:"https://pokeapi.co/api/v2/pokemon/1/")
        // Do any additional setup after loading the view.
    }
    
    
}
