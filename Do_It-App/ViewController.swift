//
//  ViewController.swift
//  Do_It-App
//
//  Created by Farah Alam on 5/5/17.
//  Copyright © 2017 Farah Alam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var tableViewScreenOne: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableViewScreenOne.dataSource = self
        tableViewScreenOne.delegate = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
        cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Mow lawn"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Walk dog"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Buy milk"
        task3.important = false
        
        return [task1, task2, task3]
        
    }

    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }

}

