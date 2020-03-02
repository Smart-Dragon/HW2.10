//
//  MainViewController.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 02.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Private Properties
    
    private let sources: [Source] = SourceDataManager.shared.getSources()
    private var items: [DataProtocol]!
    private var preloadView: UIView?
    private let dataSegue = "showData"

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == dataSegue {
            let dataVC = segue.destination as! DataViewController
            dataVC.items = items
        }
    }
    
    // MARK: - Private Methods
    
    private func loadData(source: Source) {
        showSpinner()
        guard let contentUrl = URL(string: source.url) else { return }
        
        URLSession.shared.dataTask(with: contentUrl) { (data, _, _) in
            guard let data = data else { return }
            self.items = source.getItems(from: data)
            
            DispatchQueue.main.async {
                self.removeSpinner()
                self.performSegue(withIdentifier: self.dataSegue, sender: self)
            }
        }.resume()
    }
    
    private func showSpinner() {
        let spinnerView = UIView.init(frame: view.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.9)
        
        let activityIndicator = UIActivityIndicatorView.init(style: .large)
        activityIndicator.startAnimating()
        activityIndicator.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(activityIndicator)
            self.view.addSubview(spinnerView)
        }
        
        preloadView = spinnerView
    }
    
    private func removeSpinner() {
        DispatchQueue.main.async {
            self.preloadView?.removeFromSuperview()
            self.preloadView = nil
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
        let source = sources[indexPath.row]
        loadData(source: source)
    }
    
}
