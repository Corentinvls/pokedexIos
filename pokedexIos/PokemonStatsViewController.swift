//
//  PokemonStatsViewController.swift
//  pokedexIos
//
//  Created by Laurent on 25/03/2021.
//

import UIKit

class PokemonStatsViewController: UIViewController {

    @IBOutlet weak var hpStats: UILabel!
    @IBOutlet weak var atkStats: UILabel!
    
    @IBOutlet weak var defStats: UILabel!
    
    @IBOutlet weak var spAtkStats: UILabel!
    @IBOutlet weak var spDefStats: UILabel!
    
    @IBOutlet weak var speedStats: UILabel!
    @IBOutlet weak var totalStats: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
