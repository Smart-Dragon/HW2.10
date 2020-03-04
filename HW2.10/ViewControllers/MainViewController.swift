//
//  MainViewController.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 02.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var sourcesTableView: UITableView!
    
    // MARK: - Private Properties
    
    private let sources: [Source] = SourceDataManager.shared.getSources()
    private let dataSegue = "showData"

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == dataSegue {
            let dataVC = segue.destination as! DataViewController
            if let row = sourcesTableView.indexPathForSelectedRow?.row {
                dataVC.source = sources[row]
            }
        }
    }
    
}

// MARK: - Table View Data Source

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let source = sources[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sourceCell", for: indexPath)
        cell.textLabel?.text = source.title

        return cell
    }
    
}

// MARK: - Table View Delegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sourcesTableView.deselectRow(at: indexPath, animated: true)
    }
    
}
