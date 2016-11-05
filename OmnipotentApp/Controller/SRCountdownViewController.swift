//
//  SRCountdownViewController.swift
//  OmnipotentApp
//
//  Created by GeekRRK on 15/12/7.
//  Copyright © 2015年 GeekRRK. All rights reserved.
//

import UIKit

class SRCountdownViewController: UIViewController {
    var timer: Timer?
    var countdownNum = 3
    @IBOutlet weak var countdownLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(SRCountdownViewController.countdown), userInfo: nil, repeats: true)
        timer?.fire()
    }
    
    func countdown() {
        if countdownNum == 0 {
            timer?.invalidate()
            timer = nil
            APPDELEGATE.enterApp()
        } else {
            countdownNum -= 1
            countdownLabel.text = "\(countdownNum)"
        }
    }

    @IBAction func skip(_ sender: UIButton) {
        timer?.invalidate()
        timer = nil
        APPDELEGATE.enterApp()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
