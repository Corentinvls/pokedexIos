//
//  DetailsViewController.swift
//
import UIKit

class DetailsViewController: UIViewController {
    var pokemon : AnyObject!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(pokemon["name"])
    }


}
