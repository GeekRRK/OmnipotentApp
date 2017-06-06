//
//  AppDelegate.swift
//  OmnipotentApp
//
//  Created by GeekRRK on 15/11/30.
//  Copyright © 2015年 GeekRRK. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        let letNavController = splitViewController.viewControllers.first as! UINavigationController
        let masterViewController = letNavController.topViewController as! MasterViewController
        
        let rightNavController = splitViewController.viewControllers.last as! UINavigationController
        let detailViewController = rightNavController.topViewController as? DetailViewController
        
        let firstPokemon = masterViewController.filteredPokemons.first
        detailViewController?.pokemon = firstPokemon
        
        masterViewController.delegate = detailViewController
        
        detailViewController?.navigationItem.leftItemsSupplementBackButton = true
        detailViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        
        return true
    }
    
}


