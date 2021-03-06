//
//  MainTableViewController.swift
//  CustomListItemCells
//
//  Created by Austin Blaser on 10/8/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, ListItemDelegate {
    func checkBoxTapped(cell: ListItemTableViewCell) {
        print("checkbox tapped")
        
     //guard let item = cell.listItem else {return}
      let item = ModelController.checklists[0].listItems[0]
        item.name = "Check box tapped"
        
        tableView.reloadData()
        
        
    }
    
    func responsiblePartyTapped(cell: ListItemTableViewCell) {
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
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return ModelController.checklists[section].name
//    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listItemCell", for: indexPath) as? ListItemTableViewCell else { return UITableViewCell() }
        let item = ModelController.checklists[indexPath.section].listItems[indexPath.row]
     
        cell.updateWithItem(item: item)
        cell.delegate = self
        cell.listItem = item

        return cell
    }
    
    // MARK: - Header Views
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return headerViewForSection(section: section)
    }

    func headerViewForSection(section: Int) -> UIView {
        let title = ModelController.checklists[section].name
        let view = UIView()
        view.bounds = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30)
        view.backgroundColor = UIColor.magenta
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        view.addSubview(titleLabel)
        
        let titleLabelTop = NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0)
        let titleLabelLeading = NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0)
        let titleLabelTrailing = NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0)
        
        view.addConstraints([titleLabelTop, titleLabelLeading, titleLabelTrailing])
        
        // Add Button
        let addButton = UIButton(type: .custom)
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(UIColor.black, for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        
        let addButtonBottom = NSLayoutConstraint(item: addButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let addButtonTrailing = NSLayoutConstraint(item: addButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0)
        let addButtonWidth = NSLayoutConstraint(item: addButton, attribute: .width, relatedBy: .equal, toItem: addButton, attribute: .height, multiplier: 1.0, constant: 0)
        view.addConstraints([addButtonBottom, addButtonTrailing, addButtonWidth])
        
        return view
    }

}
