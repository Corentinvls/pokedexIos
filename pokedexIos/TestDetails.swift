//
//  TestDetails.swift
//  pokedexIos
//
//  Created by Corentin Vallois on 25/03/2021.
//

//
//  DetailsViewController.swift
//
import UIKit

class TestDetails: UIViewController {
    var pokemon : AnyObject!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(pokemon["name"])
    }


}
