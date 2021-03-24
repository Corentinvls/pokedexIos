//
//  TabItemController.swift
//  pokedexIos
//
//  Created by Corentin Vallois on 23/03/2021.
//

import UIKit

class TabItemController: UICollectionViewController {
   
    override func collectionView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yourCellIdentifier") as! YourCell

        cell.label.text = "it works!"

        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }


}

