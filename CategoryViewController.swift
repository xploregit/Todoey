//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Djauhery on 16/8/18.
//  Copyright © 2018 Djauhery. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var categories : Results<Category>?
    //Results is a data type that update its data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategory()
    }

    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
        // if categories is nil then return 1 (??) Nil Coalesing Operator
        // if it is not nil, then return the count, if nil, instead use 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellCategory = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cellCategory.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added yet"
        return cellCategory
    }
    
    //MARK: - Data Manipulation Methods
    func saveCategory(with category : Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving Category \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategory() {
        
        categories = realm.objects(Category.self)
        tableView.reloadData()
    }
    
    //MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        var textField = UITextField()
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            if !(textField.text?.isEmpty)! {
                let newCategory = Category()
                newCategory.name = textField.text!
                self.saveCategory(with: newCategory)
            }
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
            If you have so many segue, then you can use if identifer this, then performSegue this identifier
        */
        let destinationVC = segue.destination as! TodoListViewController

        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }


}
