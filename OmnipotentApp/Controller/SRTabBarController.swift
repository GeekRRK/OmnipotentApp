//
//  SRTabBarController.swift
//  OmnipotentApp
//
//  Created by GeekRRK on 15/12/1.
//  Copyright © 2015年 GeekRRK. All rights reserved.
//

import UIKit

class SRTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
        
        let leftItem = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        leftItem.layer.masksToBounds = true
        leftItem.layer.cornerRadius = leftItem.frame.width * 0.5
        leftItem.setBackgroundImage(UIImage(named: "portrait"), for: UIControlState())
        leftItem.addTarget(self, action: #selector(SRTabBarController.revealLeftView(_:)), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftItem)
        
//        self.view.userInteractionEnabled = true
//        let tap = UITapGestureRecognizer(target: self, action: "tap")
//        self.view.addGestureRecognizer(tap)
    }
    
//    func tap() {
//        APPDELEGATE.drawerVC?.close()
//    }
    
    func revealLeftView(_ sender: UIButton) {
        APPDELEGATE.drawerVC?.open()
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
    
    //The suppose of this method is that the title of navigationitem can't appear when a tabbarcontroller is the rootviewcontroller of navigationcontroller.
    //Rember set the tabbarcontroller.navigationitem.title to the title of controller in index 0 because first time this method couldn't be invoked.
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let index = tabBarController.selectedIndex
        switch index {
        case 1:
            self.title = "消息"
        case 2:
            self.title = "设置"
        default:
            self.title = ""
        }
    }
}
