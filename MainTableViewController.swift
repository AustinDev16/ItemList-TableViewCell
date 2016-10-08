//
//  MainTableViewController.swift
//  CustomListItemCells
//
//  Created by Austin Blaser on 10/8/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, ListItemDelegate {
    func checkBoxTapped() {
        print("checkbox tapped")
    }
    
    func responsiblePartyTapped() {
        print("person tapped")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

 
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return ModelController.checklists.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ModelController.checklists[section].listItems.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ModelController.checklists[section].name
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listItemCell", for: indexPath) as? ListItemTableViewCell else { return UITableViewCell() }
        let item = ModelController.checklists[indexPath.section].listItems[indexPath.row]
     
        cell.updateWithItem(item: item)
        cell.delegate = self

        return cell
    }


}
