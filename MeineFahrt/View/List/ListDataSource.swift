//
//  ListDataSource.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 20/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import Foundation
import UIKit


class GenericDataSource<T>: NSObject {
  var data: DynamicValue<[T]> = DynamicValue([])
}

class ListDataSource: GenericDataSource<Poi>, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.value.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
    
    let poi = self.data.value[indexPath.row]
    cell.textLabel?.text = "\(poi.id)"
    cell.detailTextLabel?.text = poi.fleetType
    
    return cell
  }
}
