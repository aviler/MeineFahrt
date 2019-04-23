//
//  ListViewModel.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 16/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import Foundation
import CoreLocation

class ListViewModel {

  private let service: PoiService
  let dataSource: ListDataSource

  private var listItems: [ListItem] = [ListItem]()
  private let testBounds = Bounds(p1Lat: 53.694865, p1Lon: 9.757589, p2Lat: 53.394655, p2Lon: 10.099891)
  
  var showLoading: ((Bool)->())?
  
  init(withService service: PoiService, andDataSource dataSource: ListDataSource) {
    self.service = service
    self.dataSource = dataSource
  }
  
  func fetchVehicles() {
    if let load = self.showLoading { load(true) }
    
    self.service.getPois(at: testBounds) { [weak self] (data) in
      switch data {
      case .success(let pois):
        self?.proccessData(pois: pois)
      case .failure(let errString):
        print(errString.rawValue)
      }
    }
  }
  
  private func proccessData(pois: [Poi]) {
    
    let workGroup = DispatchGroup()
    
    for poi in pois {
      workGroup.enter()
      
      let geocoder = CLGeocoder()
      
      //here we use reversi geocode to evaluate addres from lat/long
      geocoder.reverseGeocodeLocation(CLLocation(latitude: poi.coordinate.latitude, longitude: poi.coordinate.longitude), completionHandler: { (placemarks, error) in
        
        var item: ListItem = ListItem()
        
        if error == nil {
          let location = placemarks?[0]
          item.address = location?.name
          
          if (poi.fleetType == "TAXI") {
            item.type = "taxi_medium.png"
          }else{
            item.type = "pooling_medium.png"
          }
          
          self.listItems.append(item)
        }
        else {
          // An error occurred during geocoding.
          item.address = "No Matching Addresses Found"
        }
        workGroup.leave()
      })
      
    }
    
    workGroup.notify(queue: .main) {
      self.dataSource.data.value = self.listItems
      if let load = self.showLoading { load(false) }
    }
  }
}
