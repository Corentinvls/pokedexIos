//
//  PokemonDetailsViewController.swift
//  pokedexIos
//
//  Created by Laurent on 24/03/2021.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    

    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonPosition: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonImg: UIImageView!
    
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

        // Do any additional setup after loading the view.
        
        PokedexApiHelper.shared.getOnePokemonByName(pokeName: "bulbasaur") { (datas, error) in
            for data in datas {
                DispatchQueue.main.async {
                    
                    self.pokemonName.text = data.pokemon.name!
                    self.pokemonPosition.text = "#\(data.pokemon.id!)"
                   
                    let imgUrl = URL(string: (data.pokemon.sprites?.frontDefault)!)!
                    self.pokemonImg.load(url: imgUrl)
                
                   
                    self.height.text = "\(data.pokemon.height!)";
                    self.weight.text = "\(data.pokemon.weight!)";
                    
                    
                    
                }
            }
        }
        
        
        
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
