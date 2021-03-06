//
//  TodoeyViewController.swift
//  Food Expiration Tracker
//
//  Created by CSUFTitan on 3/28/20.
//  Copyright © 2020 Aditi. All rights reserved.
//

import UIKit
import CoreData

class TodoeyViewController: UITableViewController {

    
    var array = [TodoeyModel]()
    var selectedCategory: Category?{
        didSet{
            loadItems()
        }
    }
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        tableView.rowHeight = 70
    }
    
    //MARK: - TableView methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemCell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row].title
        
        cell.accessoryType = array[indexPath.row].done == true ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return array.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        array[indexPath.row].done = !array[indexPath.row].done
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /*override func tableView(_ _tableView: UITableView, commit editingstyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingstyle == UITableViewCell.EditingStyle.delete
        {
            array.remove(at: indexPath.row)
            tableView.reloadData()
        
        }
    }*/
    
    override func tableView(_ _tableView: UITableView, commit editingstyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           switch editingstyle {
           case .delete:
               // remove the deleted item from the model
               let _:AppDelegate = UIApplication.shared.delegate as! AppDelegate
              // let context:NSManagedObjectContext = appDel.managedObjectContext
               context.delete(array[indexPath.row] )
               array.remove(at: indexPath.row)
               do {
                   try context.save()
               } catch _ {
               }

               // remove the deleted item from the `UITableView`
               self.tableView.deleteRows(at: [(indexPath as IndexPath)], with: .fade)
           default:
               return
           }
       }
    
//MARK: - Add button
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add item Name, Expiration Date and Cost", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
        let newItem = TodoeyModel(context: self.context)
        newItem.title = textField.text!
        newItem.done = false
        newItem.parentCategory = self.selectedCategory
        self.array.append(newItem)
        self.saveItems()
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

//MARK: - Save and Load from Persistent Cntainer
    func saveItems() {
        do{
            try context.save()
        }catch{
            print("Error saving context \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadItems(with request: NSFetchRequest<TodoeyModel> = TodoeyModel.fetchRequest(), predicate: NSPredicate? = nil) {

        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
        
        if let additionalPredicate = predicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate,additionalPredicate])
        }else{
            request.predicate = categoryPredicate
        }

        do{
            array = try context.fetch(request)
        }catch{
            print("Error in fetching: \(error)")
        }
        tableView.reloadData()
    }
}

//MARK: - Extension for Search Bar
extension TodoeyViewController: UISearchBarDelegate{
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request: NSFetchRequest<TodoeyModel> = TodoeyModel.fetchRequest()
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        print(searchBar.text!)
        loadItems(with: request, predicate: predicate)
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


