//
//  SRHomePageViewController.swift
//  OmnipotentApp
//
//  Created by GeekRRK on 15/12/1.
//  Copyright © 2015年 GeekRRK. All rights reserved.
//

import UIKit

class SRHomePageViewController: UIViewController, UIScrollViewDelegate, ZWAdViewDelagate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let centerView: UITextField = UITextField(frame: CGRect(x: 10, y: 150, width: SCREENWITH - 20, height: 30))
    let adScrollView = ZWAdView(frame: CGRect(x: 0, y: -64, width: SCREENWITH, height: 200))
    let statusView = UIView(frame: CGRect(x: 0, y: 0, width: SCREENWITH, height: 20))
    var navBarBgColorAlpha: CGFloat = 0.0
    
    func customizeNavigationItem() {
        SRUtil.customizeNavBar(self.navigationController?.navigationBar)
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: navBarBgColorAlpha)
        
        //Build leftItem of navigationitem
        let rightItem = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        rightItem.layer.masksToBounds = true
        rightItem.layer.cornerRadius = rightItem.frame.width * 0.5
        rightItem.setBackgroundImage(UIImage(named: "avatar"), for: UIControlState())
        rightItem.addTarget(self, action: #selector(SRHomePageViewController.rightBarButtonItemClicked(_:)), for: .touchUpInside)
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightItem)
        
        //Build titleView of navigationitem.
        centerView.backgroundColor = UIColor.white
        centerView.tintColor = UIColor.lightGray
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 30))
        centerView.leftViewMode = .always
        centerView.leftView = leftView
        centerView.clearButtonMode = .whileEditing
        centerView.placeholder = "测试数据"
        self.navigationController?.view.addSubview(centerView)
    }
    
    func decustomizeNavigationItem() {
        SRUtil.deCustomizeNavBar(self.navigationController?.navigationBar)
        
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
        self.tabBarController?.navigationItem.titleView = nil
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
        centerView.removeFromSuperview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.customizeNavigationItem()
        
        APPDELEGATE.drawerVC?.enablePanGesture()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.decustomizeNavigationItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(statusView)
        
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
        
        var rect = CGRect(x: 10, y: -64 + adScrollView.frame.height + 20, width: self.view.frame.width - 20, height: 100)
        for _ in 0..<4 {
            let view = UIView(frame: rect)
            view.backgroundColor = COLOR_LOGINBTN_NORMAL
            self.scrollView.addSubview(view)
            rect.origin.y = rect.origin.y + rect.height + 10
        }
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: rect.origin.y)
    }
    
    //MARK: - ZWAdViewDelagate
    func adView(_ adView: ZWAdView!, didDeselectAdAtNum num: Int) {
        print("\(num)")
    }
    
    //MARK: - UISrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let base: CGFloat = 200 - 64 - 64
        let factor: CGFloat = 1 / (base + 64)
        if scrollView.contentOffset.y <= base {
            navBarBgColorAlpha = (scrollView.contentOffset.y + 64) * factor
            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: navBarBgColorAlpha)
            statusView.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: navBarBgColorAlpha)
            
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let base: CGFloat = 200 - 64 - 64
        if scrollView.contentOffset.y > base {
            navBarBgColorAlpha = 1.0
            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: navBarBgColorAlpha)
            statusView.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: navBarBgColorAlpha)

            centerView.frame.origin.y = 20 + ((44 - 30) / 2)
            centerView.frame.size.width = 200
            centerView.frame.origin.x = (SCREENWITH - 200) / 2
        }
    }

    func rightBarButtonItemClicked(_ sender: UIBarButtonItem) {
        let itemArr = [
            KxMenuItem.init("选项一", image: nil, target: self, action: #selector(SRHomePageViewController.chooseItem(_:))),
            KxMenuItem.init("选项二", image: nil, target: self, action: #selector(SRHomePageViewController.chooseItem(_:))),
            KxMenuItem.init("选项三", image: nil, target: self, action: #selector(SRHomePageViewController.chooseItem(_:))),
        ]
        
        //Is there is another better way to get the accurate rect?
        let rect = CGRect(x: SCREENWITH - 52, y: 20 + 22 + 2, width: 44, height: 10)
        KxMenu.setTintColor(UIColor.white)
        KxMenu.show(in: APPDELEGATE.window, from: rect, menuItems: itemArr)
    }
    
    func chooseItem(_ sender:AnyObject) {
        APPDELEGATE.drawerVC?.disablePanGesture()
        
        let settingNavCtrl = STORY.instantiateViewController(withIdentifier: "settingCtrl") as! SRSettingViewController
        self.navigationController?.pushViewController(settingNavCtrl, animated: true)
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
