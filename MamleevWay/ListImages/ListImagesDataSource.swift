//
//  ListImagesDataSource.swift
//  MamleevWay
//
//  Created by Mamleev Andrey on 27.06.2023.
//

import UIKit

class ListImagesDataSource: NSObject {
    
    var list = [Image]()
}

extension ListImagesDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListImagesCell.reuseID(), for: indexPath) as? ListImagesCell else {
            return UITableViewCell()
        }
        
        cell.setUp(list: list[indexPath.row])
        
        return cell
    }
}
