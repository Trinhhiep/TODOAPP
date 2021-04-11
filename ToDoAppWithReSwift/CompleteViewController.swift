//
//  CompleteViewController.swift
//  ToDoAppWithReSwift
//
//  Created by Admin on 4/11/21.
//

import UIKit
import ReSwift
class CompleteViewController: UIViewController,UITableViewDataSource,StoreSubscriber  {

    @IBOutlet weak var secondTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        secondTableView.dataSource = self
        AppDelegate.store.subscribe(self)
        
    }
   
    
    var tasks: [MyTask] = [] {
       didSet {
         self.secondTableView.reloadData()
       }
     }
    func newState(state: AppState) {
        self.tasks = AppDelegate.store.state.MyTasks.filter{$0.status == true}
        // cập nhật tasks khi có sự thay đổi từ store
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = secondTableView.dequeueReusableCell(withIdentifier: "SECONDCELL") as! TaskTableViewCell
        
           cell.tblTaskName.text = self.tasks[indexPath.row].name
           cell.lblIndex.text = String(indexPath.row + 1)
        cell.closure = {(val : Bool)-> Void in
            print(val)
            let updateAction = UpdateTask(status: val, index: indexPath.row)
            AppDelegate.store.dispatch(updateAction)
            print(self.tasks)
        }
        if self.tasks[indexPath.row].status == true{
            cell.switchStatus.isOn = true
        }
        else{
            cell.switchStatus.isOn = false
        }
        
    
       
           
           return cell
    }
 

  

}
