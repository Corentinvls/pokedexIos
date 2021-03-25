//
//  PokedexTabsView.swift
//  pokedexIos
//
//  Created by Corentin Vallois on 24/03/2021.
//

import UIKit

class PokeDexTabsView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var test: UICollectionView!
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = [String]()
    var images = [AnyObject]()
    // MARK: - UICollectionViewDataSource protocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        fetchData()
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
       return CGSize(width: 200.0, height: 200.0)
    }
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView,  numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
   
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PokedexViewCell
       
        cell.textLabel.text = self.items[indexPath.row] // The row value is the
        cell.imageView.load(url:URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")!)
    
       
        return cell
    }
    
    func fetchData() {
        PokedexApiHelper.shared.getAllPokemon {
            (pokemons, error) in
            for pokemon in pokemons {
                PokedexApiHelper.shared.callUrl(url: pokemon.url) {
                    (data, error) in
                    self.items.append(data["name"]as! String)
                    DispatchQueue.main.async {
                        self.test.reloadData()
                    }
                }
            }
        }
      
    }
    
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
}
