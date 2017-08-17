//
//  DonetaskViewController.swift
//  TO_DO_LIST_APP
//
//  Created by Ritesh on 8/16/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class DonetaskViewController: UIViewController {

    @IBOutlet weak var doneTaskTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Done Task"
        
        doneTaskTable.register(UITableViewCell.self,
                                  forCellReuseIdentifier: "Cell")
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        doneTaskTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DonetaskViewController: UITableViewDataSource ,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return TaskModelClass.doneTaskList.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath)
        cell.textLabel?.text = TaskModelClass.doneTaskList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let alert = UIAlertController(title: "Task",
                                      message: "Task pending ?",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Yes", style: .default) { [unowned self] action in
            
            TaskModelClass.moveTaskDoneToPending(index: indexPath.row)
            self.doneTaskTable.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "No",
                                         style: .default)
        
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == UITableViewCellEditingStyle.delete)
        {
            // handle delete (by removing the data from your array and updating the tableview)
            TaskModelClass.removeDoneTask(index: indexPath.row)
            self.doneTaskTable.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
}
