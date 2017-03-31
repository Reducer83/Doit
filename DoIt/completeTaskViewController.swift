//
//  completeTaskViewController.swift
//  DoIt
//
//  Created by Richard Thomson on 17/03/2017.
//  Copyright © 2017 Richard Thomson. All rights reserved.
//

import UIKit

class completeTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    var task : Task? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task!.important == true {
            taskLabel.text = "💥 \(task!.name!)"
        } else {
            taskLabel.text = "\(task!.name!)"
        }
        
       
    }
    
    @IBAction func completeTask(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
      
        //pops user back to previous view controller
        navigationController!.popViewController(animated: true)

    }

}
