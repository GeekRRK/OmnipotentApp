//
//  ViewController.swift
//  Demo
//
//  Created by Al on 7/31/17.
//  Copyright © 2017 GeekRRK. All rights reserved.
//

import UIKit

let reusableCellId = "customCell"

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.white]
        
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.register(UINib.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reusableCellId)
        
        DispatchQueue.global().async {
//            print("good")
        }
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            print("good")
            timer.invalidate()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: reusableCellId, for: indexPath)
        let cell = Bundle.main.loadNibNamed("CustomTableViewCell", owner: nil, options: nil)?[0] as! CustomTableViewCell
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}
