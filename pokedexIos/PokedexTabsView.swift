//
//  PokedexTabsView.swift
//  pokedexIos
//
//  Created by Corentin Vallois on 24/03/2021.
//

import UIKit

class PokeDexTabsView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var pokeCollectionView: UICollectionView!
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = [PKMPokemon]()
    var images = [AnyObject]()
    // MARK: - UICollectionViewDataSource protocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTwoColumns()
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
        cell.backgroundColor =  UIColor.red.withAlphaComponent(0.8)
        cell.backgroundView = UIImageView(image: UIImage(named: "pokeball-icon"))
        cell.bounds.
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
                        self.pokeCollectionView.reloadData()
                    }
                }
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
