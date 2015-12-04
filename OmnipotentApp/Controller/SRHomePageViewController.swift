//
//  SRHomePageViewController.swift
//  OmnipotentApp
//
//  Created by suorui on 15/12/1.
//  Copyright © 2015年 suorui. All rights reserved.
//

import UIKit

class SRHomePageViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    func customizeNavigationItem() {
        SRUtil.customizeNavBar(self.navigationController?.navigationBar)
        
        let rightItem = UIButton(frame: CGRectMake(0, 0, 30, 30))
        rightItem.layer.masksToBounds = true
        rightItem.layer.cornerRadius = rightItem.width * 0.5
        rightItem.setBackgroundImage(UIImage(named: "menu"), forState: .Normal)
        rightItem.addTarget(self, action: "rightBarButtonItemClicked:", forControlEvents: .TouchUpInside)
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightItem)
        
        //Build titleView of navigationitem.
        let centerView = UITextField(frame: CGRectMake(60, 7, self.view.width - 30 * 2 - 60, 30))
        centerView.backgroundColor = UIColor.whiteColor()
        centerView.tintColor = UIColor.lightGrayColor()
        let leftView = UIView(frame: CGRectMake(0, 0, 40, 30))
//        let searchIcon = UIImageView(frame: CGRectMake(5, 0, 30, 30))
//        searchIcon.image = UIImage(named: "")
        centerView.leftViewMode = .Always
        centerView.leftView = leftView
        centerView.clearButtonMode = .WhileEditing
        centerView.placeholder = "测试数据"
        self.tabBarController?.navigationItem.titleView = centerView
    }
    
    func decustomizeNavigationItem() {
        SRUtil.deCustomizeNavBar(self.navigationController?.navigationBar)
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
        self.tabBarController?.navigationItem.titleView = nil
        self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.customizeNavigationItem()
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.decustomizeNavigationItem()
    }
    
    func hideNavBar(sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.scrollView.delegate = self
        
        let mainRect = CGRectMake(10, -64, self.view.width - 20, 250)
        let mainView = UIView(frame: mainRect)
        mainView.backgroundColor = UIColor.grayColor()
        self.scrollView.addSubview(mainView)
        let btn = UIButton(frame: CGRectMake(30, 30, 100, 50))
        btn.backgroundColor = UIColor.whiteColor()
        mainView.addSubview(btn)
        btn.addTarget(self, action: "hideNavBar:", forControlEvents: .TouchUpInside)
        
        var rect = CGRectMake(10, -64 + 250 + 20, self.view.width - 20, 100)
        for _ in 0..<4 {
            let view = UIView(frame: rect)
            view.backgroundColor = UIColor.whiteColor()
            self.scrollView.addSubview(view)
            rect.origin.y = rect.origin.y + rect.height + 10
        }
        
        self.scrollView.contentSize = CGSizeMake(self.view.width, rect.origin.y)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }

    func rightBarButtonItemClicked(sender: UIBarButtonItem) {
        let itemArr = [
            KxMenuItem.init("选项一", image: nil, target: self, action: "chooseItem:"),
            KxMenuItem.init("选项二", image: nil, target: self, action: "chooseItem:"),
            KxMenuItem.init("选项三", image: nil, target: self, action: "chooseItem:"),
        ]
        
        //Is there is another better way to get the accurate rect?
        let rect = CGRectMake(SCREENWITH - 49, 20 + 22, 44, 10)
        KxMenu.setTintColor(UIColor.whiteColor())
        KxMenu.showMenuInView(self.navigationController?.navigationBar.superview, fromRect: rect, menuItems: itemArr)
    }
    
    func chooseItem(sender:AnyObject) {
        self.view.backgroundColor = UIColor.greenColor()
        UIView.animateWithDuration(0.5, animations: {
            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
            }, completion: {
                (Bool) in
                UIView.animateWithDuration(1.5, animations: {
                    self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.4)
                    }, completion: {
                        (Bool) in
                        UIView.animateWithDuration(2.0, animations: {
                            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.1)
                            }, completion: {
                                (Bool) in
                                
                        })
                })
        })
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
