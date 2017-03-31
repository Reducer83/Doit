//
//  TasksViewController.swift
//  DoIt
//
//  Created by Richard Thomson on 11/03/2017.
//  Copyright © 2017 Richard Thomson. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    //Create tasks array to hold list of tasks
    var tasks : [Task] = []
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //set datasource and delegate of tableview to self
        
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableview.reloadData()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Set length of table to be equal to number of tasks
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Set Cell text to be specific to the index of array. IF important show the symbol
        let cell = UITableViewCell()
        let thisTask = tasks[indexPath.row]
        if thisTask.important == true {
            cell.textLabel?.text = "💥 \(thisTask.name!)"
        } else {
            cell.textLabel?.text = thisTask.name!
        }
        return cell
    }
    
    //Performs segue to completeTaskViewController and sends a task object
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTask", sender: task)
    }
    

    
    @IBAction func plusTapped(_ sender: Any) {
        //Ensure plus button performs segue to create task view controller
        performSegue(withIdentifier: "plusSegue", sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
        tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        print(tasks)
        } catch {
            print ("OOPS WE HAVE AN ERROR")
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //creates variable within tasksVC representing the next VC, to allow data to be sent to next VC.
     
        if segue.identifier == "selectTask"{
            let nextVC = segue.destination as! completeTaskViewController
            nextVC.task = sender as! Task
           
        }
        }
}








