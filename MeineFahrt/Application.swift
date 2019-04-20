//
//  Application.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 16/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import UIKit


@UIApplicationMain
class Application: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    // Network
    let poiSession = URLSession(configuration: .default)
    let poiService = PoiService(withSession: poiSession)
    
    // List
    let poiDataSource = ListDataSource()
    let listVM = ListViewModel(withService: poiService, andDataSource: poiDataSource)
    let listVC = ListViewController(withViewModel: listVM)
    
    // Map
    
    
    
    
    // Coordinator + TabBar
    
    
    
    
    // Make key and visible
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = listVC
    window.makeKeyAndVisible()
    self.window = window
    
    return true
  }
  
}
