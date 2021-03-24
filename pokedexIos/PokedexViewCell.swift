//
//  PokedexViewCell.swift
//  pokedexIos
//
//  Created by Corentin Vallois on 24/03/2021.
//

import UIKit

class PokedexViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*2/3))
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        contentView.addSubview(imageView)
         
        textLabel = UILabel(frame: CGRect(x: 0, y: imageView.frame.size.height, width: frame.size.width, height: frame.size.height/3))
        textLabel.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        textLabel.textAlignment = .center
        contentView.addSubview(textLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  /*  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> PokedexViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokedexViewCell", for: indexPath) as! PokedexViewCell
        cell.textLabel.text = "Text"
        cell.imageView.image = UIImage(named: "bowser")
        return cell
    }*/

}
