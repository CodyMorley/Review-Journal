//
//  EntriesTableViewController.swift
//  Journal
//
//  Created by Cody Morley on 8/11/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import UIKit

class EntriesTableViewController: UITableViewController {
    var entryController = EntryController()
    var entries = [Entry]()
    
    
    //MARK: Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateEntries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateEntries()
    }
    
    
    // MARK: - Tableview Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath) as? EntryTableViewCell else { fatalError("Unable to dequeue cell.") }
        cell.entry = entries[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entryToDelete = entries[indexPath.row]
            entryController.deleteEntry(entryToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        updateEntries()
    }
    
    
    //MARK: Methods
    private func updateEntries() {
        self.entries = entryController.entries
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
