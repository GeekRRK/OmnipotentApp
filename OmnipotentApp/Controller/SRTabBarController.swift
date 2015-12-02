//
//  SRTabBarController.swift
//  OmnipotentApp
//
//  Created by suorui on 15/12/1.
//  Copyright © 2015年 suorui. All rights reserved.
//

import UIKit

class SRTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
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

    @IBAction func openLeftView(sender: UIBarButtonItem) {
        APPDELEGATE.rootViewCtrl?.openLeftView()
    }
    
    //The suppose of this method is that the title of navigationitem can't appear when a tabbarcontroller is the rootviewcontroller of navigationcontroller.
    //Rember set the tabbarcontroller.navigationitem.title to the title of controller in index 0 because first time this method couldn't be invoked.
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        let index = tabBarController.selectedIndex
        switch index {
        case 0:
            self.title = "首页"
        case 1:
            self.title = "消息"
        case 2:
            self.title = "设置"
        default:
            self.title = ""
        }
    }
}
