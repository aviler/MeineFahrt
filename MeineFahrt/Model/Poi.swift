//
//  Poi.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 16/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import Foundation


//{
//  "id": 739330,
//  "coordinate": {
//    "latitude": 53.668806556867445,
//    "longitude": 10.019908942943804
//  },
//  "fleetType": "TAXI",
//  "heading": 245.2005654202569
//},

struct PoiList: Codable {
  let poiList: [Poi]
}

struct Coordinate: Codable {
  let latitude: Double
  let longitude: Double
}

struct Poi: Codable {
  
  let id: Int
  let coordinate: Coordinate
  let fleetType: String
  let heading: Double
  
//  enum CodingKeys: String, CodingKey {
//    case id = "id"
//    case coordinate = "coordinate"
//    case latitude = "latitude"
//    case longitude = "longitude"
//    case fleetType = "fleetType"
//    case heading = "heading"
//  }
//  
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    self.id = try container.decode(Int.self, forKey: .id)
//    
//    let coordinate = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .coordinate)
//    self.latitude = try coordinate.decode(Double.self, forKey: .latitude)
//    self.longitude = try coordinate.decode(Double.self, forKey: .longitude)
//    
//    self.fleetType = try container.decode(String.self, forKey: .fleetType)
//    self.heading = try container.decode(Double.self, forKey: .heading)
//  }
  
}
