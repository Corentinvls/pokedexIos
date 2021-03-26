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
    
    
    @IBOutlet weak var hpStat: UILabel!
    @IBOutlet weak var atkStat: UILabel!
    @IBOutlet weak var defStat: UILabel!
    @IBOutlet weak var speedStat: UILabel!
    @IBOutlet weak var spAtkStat: UILabel!
    @IBOutlet weak var spDefStat: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
        
        let stats = pokemon["stats"] as? [AnyObject]
        let statHp = stats![0]
        
        let hp = statHp["base_stat"]!
        hpStat.text = "\(hp!)"
        
        let statAttack = stats![1]
        let attack = statAttack["base_stat"]!
        
        atkStat.text = "\(attack!)"
        
        let statdefense = stats![2]
        let defense = statdefense["base_stat"]!
        
        defStat.text = "\(defense!)"
        
        let statSPAttack = stats![3]
        let spAtk = statSPAttack["base_stat"]!
        
        spAtkStat.text = "\(spAtk!)"
        
        let statSPDefense = stats![4]
        let spDefense = statSPDefense["base_stat"]!
        
        spDefStat.text = "\(spDefense!)"
        
        let statSpeed = stats![5]
        let spSpeed = statSpeed["base_stat"]!
        
        speedStat.text = "\(spSpeed!)"
        
        self.pokemonImage.imageFromUrl(urlString: sprites!["front_default"] as! String)
    }
    
    func setFontAndSize()
    {
        
        self.pokemonName.font = UIFont(name: "Futura", size: self.species.font.pointSize)
        
        self.pokemonPosition.font = UIFont(name: "Futura", size: self.species.font.pointSize)
        
        self.pokemonType.font = UIFont(name: "Futura", size: self.species.font.pointSize)
        
        self.species.font = UIFont(name: "Futura", size: self.species.font.pointSize)
        
        self.height.font = UIFont(name: "Futura", size: self.species.font.pointSize)
        
        self.weight.font = UIFont(name: "Futura", size: self.species.font.pointSize)
        
        /*
        
        self.malePercentage.font = UIFont(name: "Futura", size: self.abilities.font.pointSize)
        
        self.femalePercentage.font = UIFont(name: "Futura", size: self.abilities.font.pointSize)
        
        self.eggGroups.font = UIFont(name: "Futura", size: self.abilities.font.pointSize)
        
        self.eggCycle.font = UIFont(name: "Futura", size: self.abilities.font.pointSize)
        */
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
