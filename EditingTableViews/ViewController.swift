import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var purchasedItems = [ShoppingItem]()
    
    let alert = UIAlertController(title: "Delete Item", message: "Enter the name of the item you would like to remove.", preferredStyle: .alert)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return inventory.count
        case 1:
            return purchasedItems.count
        default:
            return -1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOutlet.dequeueReusableCell(withIdentifier: "Item")
        
        switch indexPath.section {
        case 0:
            cell?.textLabel?.text = inventory[indexPath.row].name
            cell?.detailTextLabel?.text = String(inventory[indexPath.row].price)
            return cell!
        case 1:
        cell?.textLabel?.text = purchasedItems[indexPath.row].name
        cell?.detailTextLabel?.text = String(purchasedItems[indexPath.row].price)
        return cell!
        default:
            return UITableViewCell()
    }
    }
    
    
    
    @IBOutlet weak var tableOutlet: UITableView!
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        
        self.present(alert, animated: true)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard let addItemVC = segue.source as? AddItemViewController else {
            fatalError()
        }
        guard let textFromName = addItemVC.nameTextField.text else {
            fatalError()
        }
        guard let textFromPrice = addItemVC.priceTextField.text else {
            fatalError()
        }
        guard let priceAsDouble = Double(textFromPrice) else {
            fatalError()
        }
        let newItem = ShoppingItem(name: textFromName, price: priceAsDouble)
        inventory.append(newItem)
        
        let lastIndex = tableOutlet.numberOfRows(inSection: 0)
        let lastIndexPath = IndexPath(row: lastIndex, section: 0)
        tableOutlet.insertRows(at: [lastIndexPath], with: .automatic )
        tableOutlet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            purchasedItems.append(inventory.remove(at: indexPath.row))
            tableOutlet.reloadData()
        case 1:
            inventory.append(purchasedItems.remove(at: indexPath.row))
            tableOutlet.reloadData()
        default:
        print("Oops")
    }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Unpurchased Items"
        case 1:
            return "Purchased Items"
        default:
            return "Oops"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableOutlet.dataSource = self
        tableOutlet.delegate = self
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: { textField in textField.placeholder = "Input item name here..." })
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            if let name = self.alert.textFields?.first?.text {
                for (i,v) in inventory.enumerated() {
                    if v.name.lowercased() == name.lowercased() {
                        inventory.remove(at: i)
                        self.tableOutlet.reloadData()
                    }
                }
                for (i,v) in self.purchasedItems.enumerated() {
                    if v.name.lowercased() == name.lowercased() {
                        self.purchasedItems.remove(at: i)
                        self.tableOutlet.reloadData()
                    }
                }
            }
        }))
    }
}

