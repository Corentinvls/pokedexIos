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
        
        print(pokemon["abilities"])
        
        // Do any additional setup after loading the view.
        pokemonName.text = pokemon["name"] as! String
        let position = pokemon["id"] as AnyObject
        pokemonPosition.text = "#\(position)"
        
        let types = pokemon["types"] as? AnyObject
        //for type in types as! [[String:Any]] {
            //print(type["type"].["name"])
        //}
        
        let sprites = pokemon["sprites"] as? AnyObject
        let urlString = sprites!["front_default"]as! String
        print (urlString)
        let url = URL(string: urlString)
        print(url!)
        //pokemonImage.load(url: url)
      
        
        let pokeHeight = pokemon["height"] as AnyObject
        height.text = "\(pokeHeight)"
        let pokeWeight = pokemon["weight"] as AnyObject
        weight.text = "\(pokeWeight)"
        
        let pokeAbilities = pokemon["abilities"] as? AnyObject
        //for ability in pokeAbilities as! [[String:Any]] {
            //print(abilities["ability"].["name"])
        //}
        
        let stats = pokemon["stats"] as? AnyObject
        
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
