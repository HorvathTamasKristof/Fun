//
//  WorkoutDataManager.swift
//  MyInsanity
//
//  Created by Tamas Horvath on 2017. 11. 04..
//  Copyright © 2017. Tamas Horvath. All rights reserved.
//

import Foundation

class WorkoutDataManager {
    
    var workouts: [AnyObject]
    
    init() {
        let filePath = Bundle.main.path(forResource: "Workouts", ofType: "plist")
        workouts = NSArray(contentsOfFile: filePath!)! as [AnyObject]
    }
}
