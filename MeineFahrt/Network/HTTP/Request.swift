//
//  Request.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 16/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import Foundation


public typealias Parameters = [String: Any]?
public typealias Headers = [String: Any]?

struct Request {
  
  static func configureRequest(from host: Hosts, and route: Routes, with parameters: Parameters?,
                               and headers: Headers?, contains body: Data?,
                               using method: Methods) throws -> URLRequest {
    
    guard let url = URL(string: host.rawValue + route.rawValue) else {
       throw NetworkError.missingURL
    }
    
    var request = URLRequest(url: url,
                             cachePolicy: .reloadIgnoringLocalCacheData,
                             timeoutInterval: 10.0)
    
    request.httpMethod = method.rawValue
    request.httpBody = body
    
    try configureParametersAndHeaders(parameters: parameters,
                                      headers: headers,
                                      request: &request)
    
    return request
  }
  
  static func configureParametersAndHeaders(parameters: Parameters?,
                                            headers: Headers?,
                                            request: inout URLRequest) throws {
    
    do {
      try URLEncoder.encodeParameters(for: &request, with: parameters)
      try URLEncoder.setHeaders(for: &request, with: headers)
    } catch let error as NetworkError {
      throw error
    }
  }
}
