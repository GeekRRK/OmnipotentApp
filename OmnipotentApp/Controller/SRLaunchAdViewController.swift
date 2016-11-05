//
//  SRLaunchAdViewController.swift
//  OmnipotentApp
//
//  Created by GeekRRK on 15/12/7.
//  Copyright © 2015年 GeekRRK. All rights reserved.
//

import UIKit

class SRLaunchAdViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupScrollView()
    }

    func setupScrollView() {
        var viewRect = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        let ad1 = UIImageView(frame: viewRect)
        ad1.image = UIImage(named: "portrait")
        scrollView.addSubview(ad1)
        
        viewRect.origin.x += viewRect.width
        let ad2 = UIImageView(frame: viewRect)
        ad2.image = UIImage(named: "avatar")
        scrollView.addSubview(ad2)
        
        viewRect.origin.x += viewRect.width
        let ad3 = UIImageView(frame: viewRect)
        ad3.image = UIImage(named: "login_background")
        scrollView.addSubview(ad3)
        
        scrollView.contentSize = CGSize(width: viewRect.width * 3, height: viewRect.height)
        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector(SRLaunchAdViewController.changePage(_:)), for: .valueChanged)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        
        if pageControl.currentPage == 2 {
            if scrollView.contentOffset.x == scrollView.frame.width * 2 {
                APPDELEGATE.enterApp()
            }
        }
        
        let page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1
        pageControl.currentPage = Int(page)
    }
    
    func changePage(_ sender: AnyObject) {
        var rect = scrollView.frame
        rect.origin.x = CGFloat(pageControl.currentPage) * scrollView.frame.width
        rect.origin.y = 0
        scrollView.scrollRectToVisible(rect, animated: true)
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
