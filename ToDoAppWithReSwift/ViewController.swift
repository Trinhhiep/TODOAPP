//
//  ViewController.swift
//  ToDoAppWithReSwift
//
//  Created by Admin on 4/10/21.
//

import UIKit
import ReSwift
class ViewController: UIViewController,UITableViewDataSource,StoreSubscriber {
    
 

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.dataSource = self
        AppDelegate.store.subscribe(self)
        
    }
    
    
    var tasks: [MyTask] = [] {
       didSet {
         self.tableView.reloadData()
       }
     }
    func newState(state: AppState) {
        self.tasks = AppDelegate.store.state.MyTasks
        // cập nhật tasks khi có sự thay đổi từ store
        
        // lưu xuống localdb
     
        do {
            let encodedData = try JSONEncoder().encode(self.tasks)
            let jsonString = String(data: encodedData, encoding: .utf8)
            
           UserDefaults.standard.set(jsonString, forKey: "store")

//            print("save: \(jsonString!)" )
//            let jsonString1 = UserDefaults.standard.string(forKey: "store")
//            print("get: \(jsonString1!)")
           
        } catch  {
            print("false")
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as! TaskTableViewCell
        
           cell.tblTaskName.text = self.tasks[indexPath.row].name
           cell.lblIndex.text = String(indexPath.row + 1)
        cell.closure = {(val : Bool)-> Void in
            
            let updateAction = UpdateTask(status: val, index: indexPath.row)
            AppDelegate.store.dispatch(updateAction)
           
        }
        if self.tasks[indexPath.row].status == true{
            cell.switchStatus.isOn = true
        }
        else{
            cell.switchStatus.isOn = false
        }
        
    
       
           
           return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //delete in store
            let deleteAction = DeleteTask(index: indexPath.row)
            AppDelegate.store.dispatch(deleteAction)
            

            

           } else if editingStyle == .insert {
               // Not used in our example, but if you were adding a new row, this is where you would do it.
           }
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
    
    
    

 
}
