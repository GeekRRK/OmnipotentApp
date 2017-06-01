//
//  StopWatch.swift
//  OmnipotentApp
//
//  Created by Al on 6/1/17.
//  Copyright © 2017 suorui. All rights reserved.
//

import UIKit

class Stopwatch: NSObject {
    var counter: Double
    var timer: Timer
    
    override init() {
        counter = 0.0
        timer = Timer()
    }
}
