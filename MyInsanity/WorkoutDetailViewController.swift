//
//  WorkoutDetailViewController.swift
//  MyInsanity
//
//  Created by Tamas Horvath on 2017. 11. 04..
//  Copyright © 2017. Tamas Horvath. All rights reserved.
//

import UIKit

class WorkoutDetailViewController: UITableViewController {
    
    private var workoutsDataManager: WorkoutDataManager?
    
    @IBOutlet weak var workoutImageView: UIImageView!
    @IBOutlet weak var workoutDaysLabel: UILabel!
    @IBOutlet weak var workoutDifficulty: UILabel!
    @IBOutlet weak var workoutEquipment: UILabel!
    @IBOutlet weak var workoutDescriptionTextView: UITextView!

    var workout: [String: AnyObject]? //eppen kivalasztott edzes adatainak tarolasa
    
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let workout = workout {
            if let workoutImageName = workout["image-name"] as? String {
                workoutImageView.image = UIImage(named: workoutImageName)
            }
            
            workoutDaysLabel.text = workout["days-name"] as? String
            workoutDifficulty.text = workout["short-description"] as? String
            workoutDescriptionTextView.text = workout["long-description"] as? String
            
            navigationItem.title = workout["name"] as? String
        }
    }
 
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WorkoutEquipmentSegue" {
                if (navigationItem.title == "Kardió") {
            let vc = segue.destination as! WorkoutEquipmentsViewController
            vc.equipment = workoutsDataManager?.workouts[1] as? [String: AnyObject]
                }
                else if (navigationItem.title == "Súlyzós") {
                    let vc = segue.destination as! WorkoutEquipmentsViewController
                    vc.equipment = workoutsDataManager?.workouts[0] as? [String: AnyObject]
                }
                else if (navigationItem.title == "HIIT"){
                    let vc = segue.destination as! WorkoutEquipmentsViewController
                    vc.equipment = workoutsDataManager?.workouts[2] as? [String: AnyObject]
                }
                else if (navigationItem.title == "Hasizom") {
                    let vc = segue.destination as! WorkoutEquipmentsViewController
                    vc.equipment = workoutsDataManager?.workouts[3] as? [String: AnyObject]
                }
            }
        }
}
