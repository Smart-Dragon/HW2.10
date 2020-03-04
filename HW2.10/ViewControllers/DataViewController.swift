//
//  DataViewController.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 02.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var dataTableView: UITableView!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    // MARK: - Public Properties
    
    var source: Source!
    var items: [DataProtocol] = []
    
    // MARK: - Private Properties
    
    private let segueDetail = "showDetail"
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = source.title
        loadData()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueDetail {
            let detailVC = segue.destination as! DetailViewController
            if let row = dataTableView.indexPathForSelectedRow?.row {
                detailVC.item = items[row]
            }
        }
    }

    // MARK: - Private Methods
    
    private func loadData() {
        NetworkManager.shared.fetchData(with: source) { items in
            DispatchQueue.main.async {
                self.items = items
                self.loadIndicator.stopAnimating()
                self.dataTableView.reloadData()
            }
        }
    }
    
}

// MARK: - Table View Data Source

extension DataViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! DataViewCell
        cell.configure(data: item)

        return cell
    }
    
}

// MARK: - Table View Delegate

extension DataViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
}
