//
//  SRSettingViewController.swift
//  OmnipotentApp
//
//  Created by GeekRRK on 15/12/3.
//  Copyright © 2015年 GeekRRK. All rights reserved.
//

import UIKit

class SRSettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var avatarBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var optionTableView: UITableView!
    
    var optionArr: [[String]]?
    let statusView = UIView(frame: CGRect(x: 0, y: 0, width: SCREENWITH, height: 20))
    
    override func viewWillAppear(_ animated: Bool) {
        APPDELEGATE.drawerVC?.navigationController?.isNavigationBarHidden = true
        self.view.addSubview(statusView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        optionTableView.backgroundColor = UIColor.clear
        
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (optionArr?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "reuseIdentifier")
        }
        // Configure the cell...
        cell?.backgroundColor = UIColor.clear
        cell?.selectionStyle = .none
        cell?.imageView?.image = UIImage(named: self.optionArr![(indexPath as NSIndexPath).row][1])
        cell?.textLabel?.text = self.optionArr![(indexPath as NSIndexPath).row][0]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        let login: UIViewController = story.instantiateViewController(withIdentifier: "loginCtrl")
        
        APPDELEGATE.drawerVC?.navigationController?.isNavigationBarHidden = false
        APPDELEGATE.drawerVC?.navigationController?.navigationBar.tintColor = UIColor.white
        APPDELEGATE.drawerVC?.navigationController!.pushViewController(login, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func clickAvatarBtn(_ sender: UIButton) {
    }
    @IBAction func clickQRCodeBtn(_ sender: UIButton) {
    }
    @IBAction func clickSettingBtn(_ sender: UIButton) {
    }
}
