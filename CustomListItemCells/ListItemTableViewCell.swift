//
//  ListItemTableViewCell.swift
//  CustomListItemCells
//
//  Created by Austin Blaser on 10/8/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class ListItemTableViewCell: UITableViewCell {

 
    
    // UIElements
    
    var itemNameLabel = UILabel()
    var checkBox = UIButton()
    var responsibleParty = UIButton()
    
    
    
    func addLabelToView(item: ListItem){
        let label = UILabel()
        self.contentView.addSubview(label)
        label.text = item.name
        label.translatesAutoresizingMaskIntoConstraints = false
        let centerX = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1.0, constant: 0)
        let centerY = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0)
        self.contentView.addConstraints([centerX, centerY])
    }
    
    
    func updateWithItem(item: ListItem){
        addElementsToView()
        
        applyLayoutConstraints()
        
        checkBox.setImage(#imageLiteral(resourceName: "incomplete"), for: .normal)
        
        
        
        
    }
    
    func applyLayoutConstraints(){
        // CheckBox button
        let checkBoxTop = NSLayoutConstraint(item: self.checkBox, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let checkBoxLeading = NSLayoutConstraint(item: self.checkBox, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1.0, constant: 0)
        let checkBoxBottom = NSLayoutConstraint(item: self.checkBox, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let checkBoxWidth = NSLayoutConstraint(item: self.checkBox, attribute: .width, relatedBy: .equal, toItem: self.checkBox , attribute: .height, multiplier: 1.0, constant: 0)
        self.contentView.addConstraints([checkBoxTop, checkBoxLeading, checkBoxBottom, checkBoxWidth])
    }
    
    func addElementsToView(){
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        responsibleParty.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(itemNameLabel)
        self.contentView.addSubview(checkBox)
        self.contentView.addSubview(responsibleParty)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func checkBoxTapped(_ sender: AnyObject) {
    }
    @IBAction func personButtonTapped(_ sender: AnyObject) {
    }
}
