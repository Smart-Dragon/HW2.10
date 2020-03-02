//
//  DataViewController.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 02.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

import UIKit

class DataViewController: UITableViewController {

    // MARK: - Public Properties
    
    var items: [DataProtocol] = []
    
    // MARK: - Private Properties
    
    private let segueDetail = "showDetail"
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! DataViewCell
        cell.configure(data: item)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueDetail {
            let detailVC = segue.destination as! DetailViewController
            if let row = tableView.indexPathForSelectedRow?.row {
                detailVC.item = items[row]
            }
        }
    }

}
