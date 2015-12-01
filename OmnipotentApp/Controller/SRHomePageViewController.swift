//
//  SRHomePageViewController.swift
//  OmnipotentApp
//
//  Created by suorui on 15/12/1.
//  Copyright © 2015年 suorui. All rights reserved.
//

import UIKit

class SRHomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    func chooseItem(sender:AnyObject) {
        print("choose item")
    }
    
    func showMenu(sender: UIBarButtonItem) {
        let itemArr = [
            KxMenuItem.init("选项一", image: nil, target: self, action: "chooseItem:"),
            KxMenuItem.init("选项二", image: nil, target: self, action: "chooseItem:"),
            KxMenuItem.init("选项三", image: nil, target: self, action: "chooseItem:"),
        ]
        
        KxMenu.showMenuInView(self.navigationController?.navigationBar.superview, fromRect: CGRectMake(10, 10, 44, 44), menuItems: itemArr)
    }
}
