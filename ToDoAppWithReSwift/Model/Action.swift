//
//  Action.swift
//  ToDoAppWithReSwift
//
//  Created by Admin on 4/10/21.
//

import Foundation
import ReSwift

struct AddTask: Action {
  var name: String
    var status : Bool
}

struct DeleteTask: Action {
  var index: Int
}
struct UpdateTask: Action {
    
    var status : Bool
    var index : Int
}
