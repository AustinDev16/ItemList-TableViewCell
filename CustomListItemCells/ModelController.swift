//
//  ModelController.swift
//  CustomListItemCells
//
//  Created by Austin Blaser on 10/8/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
class ModelController {
    
    static var checklists: [CheckList] {
        let toBring: CheckList = CheckList(name: "To Bring")
        toBring.listItems.append(ListItem(name: "Potato Salad"))
        
        let toDo: CheckList = CheckList(name: "To Do")
        toDo.listItems.append(ListItem(name: "Invite family"))
        
        return [toDo, toBring]
    }
}


class ListItem {
    var name: String
    var isComplete: Bool
    
    init(name: String, isComplete: Bool = false){
        self.name = name
        self.isComplete = isComplete
    }
}

class CheckList {
    var name: String
    var listItems: [ListItem] = []
    
    init(name: String){
        self.name = name
    }
}
