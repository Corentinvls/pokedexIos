//
//  PokemonDetailsViewController.swift
//  pokedexIos
//
//  Created by Laurent on 24/03/2021.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    
    var pokemon : AnyObject!

      
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonPosition: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var abilities: UILabel!
    
    @IBOutlet weak var malePercentage: UILabel!
    @IBOutlet weak var femalePercentage: UILabel!
    
    @IBOutlet weak var eggGroups: UILabel!
    @IBOutlet weak var eggCycle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setFontAndSize()
        // Do any additional setup after loading the view.
        
        print(pokemon["name"])
        pokemonType.layer.cornerRadius = 20;
    }
    
    func setFontAndSize()
    {
        
        self.pokemonName.font = UIFont(name: "Futura", size: self.species.font.pointSize)
        
        self.pokemonPosition.font = UIFont(name: "Futura", size: self.species.font.pointSize)
        
        self.pokemonType.font = UIFont(name: "Futura", size: self.species.font.pointSize)
        
        self.species.font = UIFont(name: "Futura", size: self.species.font.pointSize)
        
        self.height.font = UIFont(name: "Futura", size: self.species.font.pointSize)
        
        self.weight.font = UIFont(name: "Futura", size: self.species.font.pointSize)
        
        self.malePercentage.font = UIFont(name: "Futura", size: self.abilities.font.pointSize)
        
        self.femalePercentage.font = UIFont(name: "Futura", size: self.abilities.font.pointSize)
        
        self.eggGroups.font = UIFont(name: "Futura", size: self.abilities.font.pointSize)
        
        self.eggCycle.font = UIFont(name: "Futura", size: self.abilities.font.pointSize)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
