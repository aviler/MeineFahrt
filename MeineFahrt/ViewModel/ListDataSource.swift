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

class ListDataSource: GenericDataSource<ListItem>, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.value.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
    
    let item = self.data.value[indexPath.row]
    cell.address.text = item.address
    cell.fleet.image = UIImage(named: item.type!)
 
    return cell
  }
}
