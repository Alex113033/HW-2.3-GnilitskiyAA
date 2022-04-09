//
//  EntryViewController.swift
//  HW 2.3 GnilitskiyAA
//
//  Created by Александр on 05.04.2022.
//

import UIKit

class EntryViewController: UIViewController {

    @IBOutlet var entryName: UILabel!
    
    var entryNameReception: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entryName.text = "Hello, " + entryNameReception + "!"
    }
}
