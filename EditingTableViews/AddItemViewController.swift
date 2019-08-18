//
//  AddItemViewController.swift
//  EditingTableViews
//
//  Created by Kevin Natera on 8/16/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation
import UIKit


class AddItemViewController : UIViewController {
    
    var name: String!
    var price: String!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    

    
    @IBAction func nameDidEndOnExit(_ sender: UITextField) {
        nameTextField.resignFirstResponder()
    }
    
    
    @IBAction func priceDidEndOnExit(_ sender: UITextField) {
        priceTextField.resignFirstResponder()
    }
    
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
    
    
    }
    
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


