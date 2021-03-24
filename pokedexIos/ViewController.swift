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
        // Do any additional setup after loading the view.
    }
    
    
}
