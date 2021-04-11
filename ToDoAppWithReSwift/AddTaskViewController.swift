//
//  AddTaskViewController.swift
//  ToDoAppWithReSwift
//
//  Created by Admin on 4/11/21.
//

import UIKit

class AddTaskViewController: UIViewController {

   
    @IBOutlet weak var txtfTaskName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnAdd_clicked(_ sender: Any) {
        if txtfTaskName.text != ""{
           let name = txtfTaskName.text
            let addTaskAction = AddTask(name: name!, status: false)
            AppDelegate.store.dispatch(addTaskAction)
            navigationController?.popViewController(animated: true)
        }
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
