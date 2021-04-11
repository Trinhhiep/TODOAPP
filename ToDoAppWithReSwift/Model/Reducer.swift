//
//  Reducer.swift
//  ToDoAppWithReSwift
//
//  Created by Admin on 4/10/21.
//

import Foundation
import ReSwift

func appReducers(action: Action, state: AppState?) -> AppState {

  var state = state ?? AppState(tasks: []) // tạo ra một state mới từ state cũ chứ không thay đổi state cũ

  switch action {

  case let addTask as AddTask:
    
    let task = MyTask(name: addTask.name, status: false)
    state.MyTasks.insert(task, at: 0)

  case let deleteTask as DeleteTask:
    state.MyTasks.remove(at: deleteTask.index)

  case let updateTask as UpdateTask:
    state.MyTasks[updateTask.index].status = updateTask.status
    
  default:
    return state

  }

  return state
}
