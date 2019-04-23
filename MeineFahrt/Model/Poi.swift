//
//  Poi.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 16/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import Foundation


struct PoiList: Codable {
  let poiList: [Poi]
}

@objc class Coordinate: NSObject, Codable {
  @objc var latitude: Double
  @objc var longitude: Double
}

@objc class Poi: NSObject, Codable {
  @objc var id: Int
  @objc var coordinate: Coordinate
  @objc var fleetType: String
  @objc var heading: Double
}
