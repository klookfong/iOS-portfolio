

import UIKit
import CoreData

class ToDoListViewController: UITableViewController {
     @IBOutlet weak var searchBar: UISearchBar!
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    var itemArray = [List]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        
    }
    
    
}


//MARK: - Datasource Methods
extension ToDoListViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count}
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.completed ? .checkmark: .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].completed = !itemArray[indexPath.row].completed
       // context?.delete(itemArray[indexPath.row])
        //itemArray.remove(at: indexPath.row)
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


//MARK: - Add New Items
extension ToDoListViewController{
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add a New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let newItem = List(context: self.context!)
            newItem.completed = false
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.saveItems()
        }
        alert.addTextField { (altTextField) in
            altTextField.placeholder = "Create a New Item"
            textField = altTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
}
//MARK: - Saving and Loading Items
extension ToDoListViewController{
    func saveItems(){
        do{
            try context?.save()
            tableView.reloadData()
        }catch{
            print("error \(error)")
        }
    }
    
    func loadItems(request: NSFetchRequest<List> = List.fetchRequest()){
        do {
            if let resultFromFetch = try context?.fetch(request){
                itemArray = resultFromFetch
            }
        } catch  {
            print(error)
        }
    }
   
}

//MARK: - Search Bar Methods
//
extension ToDoListViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request: NSFetchRequest<List> = List.fetchRequest()
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        request.predicate = predicate
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        loadItems(request: request)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0{
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
