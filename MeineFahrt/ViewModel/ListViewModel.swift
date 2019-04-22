//
//  ListViewModel.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 16/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import Foundation


class ListViewModel {

  private let service: PoiService
  let dataSource: ListDataSource
  
  private var pois: [Poi]?
  
  private let testBounds = Bounds(p1Lat: 53.694865, p1Lon: 9.757589, p2Lat: 53.394655, p2Lon: 10.099891)
  
  init(withService service: PoiService, andDataSource dataSource: ListDataSource) {
    self.service = service
    self.dataSource = dataSource
  }
  
  func fetchVehicles() {    
    self.service.getPois(at: testBounds) { [weak self] (data) in
      switch data {
      case .success(let pois):
        self?.dataSource.data.value = pois
      case .failure(let errString):
        print(errString.rawValue)
      }
    }
  }  
}
