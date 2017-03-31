//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Richard Thomson on 12/03/2017.
//  Copyright © 2017 Richard Thomson. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addTapped(_ sender: Any) {
        //create task from the outlet information on screen
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = taskNameField.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Add the task to the array in the previous view controllwe
      
        //pops user back to previous view controller
        navigationController!.popViewController(animated: true)
    }
    
}
