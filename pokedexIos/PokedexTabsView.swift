//
//  PokedexTabsView.swift
//  pokedexIos
//
//  Created by Corentin Vallois on 24/03/2021.
//

import UIKit
import PokemonAPI

class PokeDexTabsView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var pokeCollectionView: UICollectionView!
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var pokemon = [AnyObject]()
    var images = [AnyObject]()
    // MARK: - UICollectionViewDataSource protocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTwoColumns()
        fetchPokemon()
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
       return CGSize(width: 200.0, height: 200.0)
    }
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView,  numberOfItemsInSection section: Int) -> Int {
        return self.pokemon.count
    }
   
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PokedexViewCell
        let poke = self.pokemon[indexPath.row]
        cell.textLabel.text = poke["name"] as? String// The row value is the
      let test = poke["sprites"] as? AnyObject// The row value is the
        
        cell.imageView.load(url:URL(string:test!["front_default"] as! String)!)
        cell.layer.shadowColor = UIColor.darkGray.cgColor
        cell.backgroundColor =  UIColor.red.withAlphaComponent(0.8)
        cell.backgroundView = UIImageView(image: UIImage(named: "pokeball-icon"))
        cell.layer.shadowOffset = CGSize(width:2.0,height: 4.0)
        cell.layer.shadowRadius = 8.0
           cell.layer.shadowOpacity = 1.0
           cell.layer.masksToBounds = false;
        cell.layer.cornerRadius=20
           cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
       
        return cell
    }
    
   
    func fetchPokemon() {
        PokedexApiHelper.shared.fetchPokemon { (pokemon) in
            DispatchQueue.main.async {
                self.pokemon = pokemon
                self.pokeCollectionView.reloadData()
            }
        }
    }
    func setTwoColumns() {
        if let layout = pokeCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 10
            
                layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
                let size = CGSize(width:(pokeCollectionView!.bounds.width-30)/2, height: 180)
                layout.itemSize = size
        }
      
    }
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
}
