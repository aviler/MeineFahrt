//
//  PoiService.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 17/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import Foundation


struct Bounds {
  let p1Lat: Double
  let p1Lon: Double
  let p2Lat: Double
  let p2Lon: Double
  
  func asParameters() -> [String:String] {
    return [ "p1Lat":"\(p1Lat)", "p1Lon":"\(p1Lon)",
      "p2Lat":"\(p2Lat)", "p2Lon":"\(p2Lon)"]
  }
}

struct PoiService {
  
  let session: URLSession
  
  init(withSession session: URLSession) {
    self.session = session
  }
  
  func getPois(at bounds: Bounds, _ completion: @escaping (Result<[Poi]>) -> ()) {
    do{
      let request = try Request.configureRequest(from: .prod,
                                                 and: .none,
                                                 with: bounds.asParameters(),
                                                 and: nil,
                                                 contains: nil,
                                                 using: .get
      )
      
      self.session.dataTask(with: request) { (data, res, err) in
        
        if let response = res as? HTTPURLResponse, let unwrappedData = data {
          
          let result = Response.handleResponse(for: response)
          switch result {
          case .success:
            let result = try? JSONDecoder().decode(PoiList.self,
                                                   from: unwrappedData)
            completion(Result.success(result!.poiList))
            
          case .failure(let error):
            completion(Result.failure(error))
          }
        }
        }.resume()
    } catch let error as NetworkError {
      completion(Result.failure(error))
    } catch {
      print(error.localizedDescription)
    }
  }
}
