//
//  SRHomePageViewController.swift
//  OmnipotentApp
//
//  Created by suorui on 15/12/1.
//  Copyright © 2015年 suorui. All rights reserved.
//

import UIKit

class SRHomePageViewController: UIViewController, UIScrollViewDelegate, ZWAdViewDelagate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let centerView: UITextField = UITextField(frame: CGRectMake(10, 150, SCREENWITH - 20, 30))
    let adScrollView = ZWAdView(frame: CGRectMake(0, -64, SCREENWITH, 200))
    
    var navBarBgColorAlpha: CGFloat = 0.0
    
    func customizeNavigationItem() {
        SRUtil.customizeNavBar(self.navigationController?.navigationBar)
        
        APPDELEGATE.window?.addSubview(APPDELEGATE.statusView)
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: navBarBgColorAlpha)
        
        //Build leftItem of navigationitem
        let rightItem = UIButton(frame: CGRectMake(0, 0, 30, 30))
        rightItem.layer.masksToBounds = true
        rightItem.layer.cornerRadius = rightItem.frame.width * 0.5
        rightItem.setBackgroundImage(UIImage(named: "avatar"), forState: .Normal)
        rightItem.addTarget(self, action: "rightBarButtonItemClicked:", forControlEvents: .TouchUpInside)
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightItem)
        
        //Build titleView of navigationitem.
        centerView.backgroundColor = UIColor.whiteColor()
        centerView.tintColor = UIColor.lightGrayColor()
        
        let leftView = UIView(frame: CGRectMake(0, 0, 5, 30))
        centerView.leftViewMode = .Always
        centerView.leftView = leftView
        centerView.clearButtonMode = .WhileEditing
        centerView.placeholder = "测试数据"
        self.navigationController?.view.addSubview(centerView)
    }
    
    func decustomizeNavigationItem() {
        SRUtil.deCustomizeNavBar(self.navigationController?.navigationBar)
        
        APPDELEGATE.statusView.removeFromSuperview()
        
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
        self.tabBarController?.navigationItem.titleView = nil
        self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
        
        centerView.removeFromSuperview()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.customizeNavigationItem()
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.decustomizeNavigationItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.scrollView.delegate = self
        
        let imageArray = [
            "http://cdn.duitang.com/uploads/item/201210/31/20121031085212_Kv4zZ.thumb.600_0.jpeg",
            "http://img5.duitang.com/uploads/item/201307/09/20130709201608_t5BJF.jpeg",
            "http://mg.soupingguo.com/bizhi/big/10/350/642/10350642.jpg",
            "http://iphone.tgbus.com/UploadFiles/201301/20130130145233400.jpg"
        ]
        
        adScrollView.delegate = self
        adScrollView.adDataArray = NSMutableArray(array: imageArray)
        adScrollView.hidePageControl = true
        adScrollView.adAutoplay = true
        adScrollView.adPeriodTime = 2.5
        adScrollView.placeImageSource = "avatar"
        adScrollView.loadAdDataThenStart()
        self.scrollView.addSubview(adScrollView)
        
        var rect = CGRectMake(10, -64 + adScrollView.frame.height + 20, self.view.frame.width - 20, 100)
        for _ in 0..<4 {
            let view = UIView(frame: rect)
            view.backgroundColor = COLOR_LOGINBTN_NORMAL
            self.scrollView.addSubview(view)
            rect.origin.y = rect.origin.y + rect.height + 10
        }
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width, rect.origin.y)
    }
    
    //MARK: - ZWAdViewDelagate
    func adView(adView: ZWAdView!, didDeselectAdAtNum num: Int) {
        print("\(num)")
    }
    
    //MARK: - UISrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let base: CGFloat = 200 - 64 - 64
        let factor: CGFloat = 1 / (base + 64)
        if scrollView.contentOffset.y <= base {
            navBarBgColorAlpha = (scrollView.contentOffset.y + 64) * factor
            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: navBarBgColorAlpha)
            APPDELEGATE.statusView.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: navBarBgColorAlpha)
            
            var rect = centerView.frame
            rect.origin.y = -(scrollView.contentOffset.y + 64) + 160
            rect.size.width = -(scrollView.contentOffset.y + 64) + 300
            
            if rect.origin.y <= 20 + ((44 - 30) / 2) {
                rect.origin.y = 20 + ((44 - 30) / 2)
            }
            
            if rect.size.width <= 200 {
                rect.size.width = 200
            }
            
            rect.origin.x = (SCREENWITH - rect.width) / 2
            
            centerView.frame = rect
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let base: CGFloat = 200 - 64 - 64
        if scrollView.contentOffset.y > base {
            navBarBgColorAlpha = 1.0
            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: navBarBgColorAlpha)
            APPDELEGATE.statusView.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: navBarBgColorAlpha)
            
            centerView.frame.origin.y = 20 + ((44 - 30) / 2)
            centerView.frame.size.width = 200
            centerView.frame.origin.x = (SCREENWITH - 200) / 2
        }
    }

    func rightBarButtonItemClicked(sender: UIBarButtonItem) {
        let itemArr = [
            KxMenuItem.init("选项一", image: nil, target: self, action: "chooseItem:"),
            KxMenuItem.init("选项二", image: nil, target: self, action: "chooseItem:"),
            KxMenuItem.init("选项三", image: nil, target: self, action: "chooseItem:"),
        ]
        
        //Is there is another better way to get the accurate rect?
        let rect = CGRectMake(SCREENWITH - 52, 20 + 22, 44, 10)
        KxMenu.setTintColor(UIColor.whiteColor())
        KxMenu.showMenuInView(APPDELEGATE.window, fromRect: rect, menuItems: itemArr)
    }
    
    func chooseItem(sender:AnyObject) {
        
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
