//
//  Error.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 16/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import Foundation


public enum NetworkError: String, Error {  
  case emptyParameters = "Error: Parameter key or value is empty."
  case emptyHeaders = "Error: Headers key or value is empty."
  case encodingFailed = "Error: Parameter Encoding failed."
  case decodingFailed = "Error: Unable to Decode the data."
  case missingURL = "Error: The URL is nil."
  case couldNotParse = "Error: Unable to parse the JSON response."
  case noData = "Error: The data from API is Nil."
  case fragmentResponse = "Error: The API's response's body has fragments."
  case unwrappingError = "Error: Unable to unwrape the data."
  case dataTaskFailed = "Error: The Data Task object failed."
  case success = "Successful Network Request"
  case authenticationError = "Error: You must be Authenticated"
  case badRequest = "Error: Bad Request"
  case pageNotFound = "Error: Page/Route requested not found."
  case failed = "Error: Network Request failed"
  case serverSideError = "Error: Server error"
}
