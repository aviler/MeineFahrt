//
//  ListViewController.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 16/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import UIKit


class ListViewController: UIViewController, UITableViewDelegate {
  
  @IBOutlet weak var listTableView: UITableView!
  @IBOutlet weak var loadingView: UIView!
  
  private let viewModel: ListViewModel
  
  init(withViewModel vm: ListViewModel) {
    self.viewModel = vm
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewModel.showLoading  = { [weak self] (show) in
      DispatchQueue.main.async {
        self?.loadingView.isHidden = !show        
      }
    }

    setTableView()
    
    self.viewModel.fetchVehicles()
  }
  
  func setTableView() {
    self.listTableView.dataSource = self.viewModel.dataSource
    self.listTableView.delegate = self
    
    self.viewModel.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
      DispatchQueue.main.async {
        self?.listTableView.reloadData()
      }
    }
    
    self.listTableView.register(UINib(nibName: "ListCell", bundle: nil),
                                forCellReuseIdentifier: "listCell")
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
}
