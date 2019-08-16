//
//  ShoppingItemsViewController.swift
//  EditingTableViews
//
//  Created by Krystal Campbell on 8/16/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ShoppingItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var shoppingItemsTableView: UITableView!
    
    private var shoppingItems = [ShoppingItem] ()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    @IBAction func editButtonPressed(_ sender: UIButton) {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        private func loadShoppingItems() {
            let allItems = ShoppingItemFetchingClient.getShoppingItems()
            shoppingItems = allItems
        }
        
        private func configureShoppingItemsTableView() {
            shoppingItemsTableView.dataSource = self
            shoppingItemsTableView.delegate = self
        }

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
