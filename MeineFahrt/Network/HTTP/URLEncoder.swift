//
//  URLEncoder.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 16/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import Foundation


public struct URLEncoder {
  
  static func encodeParameters(for urlRequest: inout URLRequest,
                               with parameters: Parameters?) throws {
    
    guard let param = parameters else { return }
    
    guard let firstItem = param?.first else { return }
    let value = firstItem.value as! String
    if firstItem.key.isEmpty || value.isEmpty  { throw NetworkError.emptyParameters }
    
    if var urlComponents = URLComponents(url: urlRequest.url!,
                                         resolvingAgainstBaseURL: false) {
      
      urlComponents.queryItems = [URLQueryItem]()
      
      for (key,value) in param! {
        let queryItem = URLQueryItem(name: key, value: "\(value)")        
        urlComponents.queryItems?.append(queryItem)
      }
      
      urlRequest.url = urlComponents.url
    }
  }
  
  static func setHeaders(for urlRequest: inout URLRequest,
                         with headers: Headers?) throws {

    guard let head = headers else { return }
    
    guard let firstItem = head?.first else { return }
    let value = firstItem.value as! String
    if firstItem.key.isEmpty || value.isEmpty { throw NetworkError.emptyHeaders }
    
    for (key, value) in head!{
      urlRequest.setValue(value as? String, forHTTPHeaderField: key)
    }
  }
}
