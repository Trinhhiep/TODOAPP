//
//  AppState.swift
//  ToDoAppWithReSwift
//
//  Created by Admin on 4/10/21.
//

import Foundation
import ReSwift

struct AppState: StateType {
    var MyTasks: [MyTask] = []

  init(tasks: [MyTask]) {
    self.MyTasks = tasks
  }
}
