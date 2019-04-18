//
//  AppDelegate.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 16/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    
    let poiSession = URLSession(configuration: .default)
    let poiService = PoiService(withSession: poiSession)
    
    let listVM = ListViewModel(withService: poiService)
    
    let listVC = ListViewController(withViewModel: listVM)
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = listVC
    window.makeKeyAndVisible()
    self.window = window
    
    return true
  }
  
}

