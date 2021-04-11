//
//  IncompleteViewController.swift
//  ToDoAppWithReSwift
//
//  Created by Admin on 4/11/21.
//

import UIKit
import ReSwift
class IncompleteViewController: UIViewController,UITableViewDataSource,StoreSubscriber  {

    @IBOutlet weak var thirdTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        thirdTableView.dataSource = self
        AppDelegate.store.subscribe(self)
        
    }
   
    
    var tasks: [MyTask] = [] {
       didSet {
         self.thirdTableView.reloadData()
       }
     }
    func newState(state: AppState) {
        self.tasks = AppDelegate.store.state.MyTasks.filter{$0.status == false}
        // cập nhật tasks khi có sự thay đổi từ store
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = thirdTableView.dequeueReusableCell(withIdentifier: "THIRDCELL") as! TaskTableViewCell
        
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
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
