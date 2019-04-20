//
//  Response.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 16/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import Foundation


enum Result<T> {  
  case success(T)
  case failure(NetworkError)
}

struct Response {
  
  static func handleResponse(for response: HTTPURLResponse?) -> Result<String> {
    
    guard let res = response else {
      return .failure(NetworkError.unwrappingError)
    }
    
    switch res.statusCode {
      case 200...299: return .success(NetworkError.success.rawValue)
      case 401: return .failure(NetworkError.authenticationError)
      case 400...499: return .failure(NetworkError.badRequest)
      case 500...599: return .failure(NetworkError.serverSideError)
      default: return .failure(NetworkError.failed)
    }
  }
}
