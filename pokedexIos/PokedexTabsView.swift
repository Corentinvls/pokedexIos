//
//  PokedexTabsView.swift
//  pokedexIos
//
//  Created by Corentin Vallois on 24/03/2021.
//

import UIKit
import Alamofire
import AlamofireImage

class PokeDexTabsView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["1", "2"]
    let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")!
    var images = [AnyObject]()
    // MARK: - UICollectionViewDataSource protocol
   
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView,  numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {
          return CGSize(width: 200.0, height: 200.0)
       }
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PokedexViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.textLabel.text = self.items[indexPath.row] // The row value is the same as the index of the desired text within the array.
        // Create URL
        cell.imageView.load(url:self.url)
    
       
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
}
