//
//  Endpoint.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 16/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import Foundation


public enum Hosts: String {
  case prod = "https://fake-poi-api.mytaxi.com"
}

public enum Routes: String {
  case none = ""
}

public enum Methods: String{
  case get = "GET"
  case post = "POST"
  case put = "PUT"
  case patch = "PATCH"
  case delete = "DELETE"
}
