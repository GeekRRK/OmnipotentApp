//
//  SRSettingViewController.swift
//  OmnipotentApp
//
//  Created by suorui on 15/12/3.
//  Copyright © 2015年 suorui. All rights reserved.
//

import UIKit

class SRSettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var avatarBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var optionTableView: UITableView!
    
    var optionArr: [[String]]?
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        optionArr = [
            ["选项一", "tab_netwo"],
            ["选项二", "tab_message"],
            ["选项三", "tab_setting"],
            ["选项四", "tab_netwo_sel"]
        ]
        self.optionTableView.dataSource = self
        self.optionTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (optionArr?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier")
        if cell == nil {
            cell = UITableViewCell(style: .Value1, reuseIdentifier: "reuseIdentifier")
        }
        // Configure the cell...
        cell?.imageView?.image = UIImage(named: self.optionArr![indexPath.row][1])
        cell?.textLabel?.text = self.optionArr![indexPath.row][0]
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let story = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let login: UIViewController = story.instantiateViewControllerWithIdentifier("loginCtrl")
        APPDELEGATE.rootViewCtrl?.closeLeftView()
        APPDELEGATE.mainViewNavCtrl?.pushViewController(login, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func clickAvatarBtn(sender: UIButton) {
    }
    @IBAction func clickQRCodeBtn(sender: UIButton) {
    }
    @IBAction func clickSettingBtn(sender: UIButton) {
    }
}
