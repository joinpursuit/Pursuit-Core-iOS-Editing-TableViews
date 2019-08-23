import UIKit


/*
 - rename the view controller as "ShoppingItemsViewController" to be more descriptive
 - load all of the "ShoppingItems" into a table view in your ShoppingItemsViewController. the tableview should be pinned to the edges of its superview
 - set up data source and delegate for the tableview
 - refactor some of the above so that they call the two private methods below in your viewDidLoad:
 
 private func loadShoppingItems() {
 let allItems = ShoppingItemFetchingClient.getShoppingItems()
 shoppingItems = allItems
 }
 
 private func configureShoppingItemsTableView() {
 shoppingItemsTableView.dataSource = self
 shoppingItemsTableView.delegate = self
 }

 */



class ShoppingItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    var shoppingItems = [ShoppingItem]()
    
    @IBAction func unwind (segue: UIStoryboardSegue){
        guard let addItems = segue.source as? AddItemViewController else {fatalError()}
        guard let textFromName = addItems.nameText.text, let textFromPrice = addItems.priceText.text, let priceAsDouble = Double(textFromPrice)
            else{
                fatalError()
        }
        let newItem = ShoppingItem(name: textFromName, price: priceAsDouble)
        let lastIndex = tableViewOutlet.numberOfRows(inSection: 0)
        let lastIndexPath = IndexPath(row: lastIndex, section: 0)
        tableViewOutlet.insertRows(at: [lastIndexPath] , with: .automatic)
    }
    
    
    @IBAction func edit(_ sender: UIButton!) {
        if tableViewOutlet.isEditing{
            tableViewOutlet.setEditing(false, animated: true)
            sender.setTitle("Edit", for: .normal)
        }
        else {
            //tableView.isEditing = true
            tableViewOutlet.setEditing(true, animated: true)
            sender.setTitle("Done", for: .normal)
        }
    }
    
    var newPrice: String!
    var newName: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadShoppingItems()
        configureShoppingItemsTableView()
        tableViewOutlet.isEditing = false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "ourCell", for: indexPath)
        
        
        cell.textLabel?.text = shoppingItems[indexPath.row].name
        cell .detailTextLabel?.text = String(shoppingItems[indexPath.row].price)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            shoppingItems.remove(at: indexPath.row)
            tableViewOutlet.deleteRows(at: [indexPath], with: .fade)
        default: break
        }
    }
    
    private func loadShoppingItems() {
        let allItems = ShoppingItemFetchingClient.getShoppingItems()
        shoppingItems = allItems
    }
    
    private func configureShoppingItemsTableView() {
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
    }
    
}

