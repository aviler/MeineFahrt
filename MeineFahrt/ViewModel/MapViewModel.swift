//
//  MapViewModel.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 21/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import Foundation


@objc class MapViewModel: NSObject {
  
  private let service: PoiService
  
  private var data: [Poi] = [Poi]() {
    didSet {
      self.updatePoiOnMap?(self.data)
    }
  }
  
  // closure/bond to update viewcontroller
  @objc private var updatePoiOnMap: (([Poi])->())?
  
  @objc init(withService service: PoiService) {
    self.service = service
  }
  
  @objc func fetchVehiclesAt(p1Lat: Double, p1Lon: Double,
                             p2Lat: Double, p2Lon: Double,
                             completion: @escaping ([Poi]) -> ()) {
    self.updatePoiOnMap = completion
    let bounds = Bounds(p1Lat: p1Lat, p1Lon: p1Lon, p2Lat: p2Lat, p2Lon: p2Lon)
    self.service.getPois(at: bounds) { [weak self] (data) in
      switch data {
      case .success(let pois):
        self?.data = pois
      case .failure(let errString):
        print(errString.rawValue)
      }
    }
  }
}
