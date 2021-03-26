//
//  Extensions.swift
//  pokedexIos
//
//  Created by Corentin Vallois on 24/03/2021.
//


import UIKit
import Alamofire

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
            
                    }
                }
            }
        }
    }
}

extension UIImageView {
     func imageFromUrl(urlString: String) {
        if let url = URL(string: urlString) {
            let request = NSURLRequest(url: url)
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main) {
                (response: URLResponse!, data: Data!, error: Error!) -> Void in
                self.image = UIImage(data: data)
            }
        }
    }
}
