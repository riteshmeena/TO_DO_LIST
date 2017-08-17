//
//  TaskModelClass.swift
//  TO_DO_LIST_APP
//
//  Created by Ritesh on 8/16/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class TaskModelClass: NSObject
{
    static var pendindTaskList: [String] = []
    static var doneTaskList: [String] = []
    
    class func savePendingTask(name : String)
    {
        pendindTaskList.append(name)
    }
    
    class func removePendingTask(index : Int)
    {
        pendindTaskList.remove(at: index)
    }
    class func saveDoneTask(name : String)
    {
        doneTaskList.append(name)
    }
    
    class func removeDoneTask(index : Int)
    {
        doneTaskList.remove(at: index)
    }
    
    class func moveTaskPendingToDone(index : Int)
    {
        doneTaskList.append(pendindTaskList[index])
        pendindTaskList.remove(at: index)
    }
    class func moveTaskDoneToPending(index : Int)
    {
        pendindTaskList.append(doneTaskList[index])
        doneTaskList.remove(at: index)
    }
    
}
