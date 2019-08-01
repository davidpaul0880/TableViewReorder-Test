//
//  ViewController.swift
//  ReorderTest
//
//  Created by Jijo Pulikkottil on 01/08/19.
//  Copyright © 2019 Jijo Pulikkottil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var items = (1...20).map { "Item \($0)" }
    @IBOutlet weak var tableViewReorder: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Reorder TableView"
        // Do any additional setup after loading the view.
        tableViewReorder.delegate = self
        tableViewReorder.dataSource = self
        tableViewReorder.reorder.delegate = self
        tableViewReorder.rowHeight = 120
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let spacer = tableViewReorder.reorder.spacerCell(for: indexPath) {
            return spacer
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
}

extension ViewController: TableViewReorderDelegate {
    
    func tableView(_ tableView: UITableView, reorderRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = items[sourceIndexPath.row]
        items.remove(at: sourceIndexPath.row)
        items.insert(item, at: destinationIndexPath.row)
    }
    
}
