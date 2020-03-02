//
//  DetailViewController.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 02.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTextView: UITextView!
    
    // MARK: - Public Properties
    
    var item: DataProtocol!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        
        itemTextView.text = item.dataDescription
        
        DispatchQueue.global().async {
            guard let imgUrl = URL(string: self.item.dataImgUrl) else { return }
            guard let imgData = try? Data(contentsOf: imgUrl) else { return }
            
            DispatchQueue.main.async {
                self.itemImageView.image = UIImage(data: imgData)
            }
        }
    }

}
