//
//  TaskTableViewCell.swift
//  ToDoAppWithReSwift
//
//  Created by Admin on 4/10/21.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    var closure : ((Bool) -> Void )?
    @IBOutlet weak var lblIndex: UILabel!
    @IBOutlet weak var switchStatus: UISwitch!
    @IBOutlet weak var tblTaskName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func Switch_Change(_ sender: UISwitch) {
        closure!(sender.isOn)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
