//
//  CreateShoppingItemViewController.swift
//  EditingTableViews
//
//  Created by Krystal Campbell on 8/16/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class CreateShoppingItemViewController: UIViewController {

    // MARK: - IBOutlets
    
    
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var priceLabel: UITextField!
    
//    // MARK: - IBActions
//
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
