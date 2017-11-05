//
//  WorkoutsViewController.swift
//  MyInsanity
//
//  Created by Tamas Horvath on 2017. 11. 04..
//  Copyright © 2017. Tamas Horvath. All rights reserved.
//

import UIKit

class WorkoutsViewController: UITableViewController {
    
    private var workoutsDataManager: WorkoutDataManager? //ezen keresztul erjuk el az edzesek adatait

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        workoutsDataManager = (UIApplication.shared.delegate as? AppDelegate)?.workoutsDataManager
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutsDataManager!.workouts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutsTableViewCell", for: indexPath)

        let workoutData = workoutsDataManager!.workouts[indexPath.row] as! [String: AnyObject]
        cell.textLabel?.text = workoutData["name"] as? String
        cell.detailTextLabel?.text = workoutData["short-description"] as? String

        if let workoutImageName = workoutData["image-name"] as? String {
            cell.imageView?.image = UIImage(named: workoutImageName)
        }
        
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WorkoutDetailSegue" {
            let vc = segue.destination as? WorkoutDetailViewController
            let row = tableView.indexPathForSelectedRow?.row
            vc?.workout = workoutsDataManager?.workouts[row!] as? [String: AnyObject]
        }
    }
    
}
