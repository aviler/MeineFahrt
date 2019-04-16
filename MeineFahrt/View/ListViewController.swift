//
//  ListViewController.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 16/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import UIKit


class ListViewController: UIViewController {
  
  let viewmodel: ListViewModel
  
  init(withViewModel vm: ListViewModel) {
    self.viewmodel = vm
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ListViewController didLoad()")
    self.viewmodel.fetchCars()
  }
  
}
