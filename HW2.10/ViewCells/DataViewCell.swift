//
//  DataViewCell.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 02.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

import UIKit

class DataViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var dataImageView: UIImageView!
    @IBOutlet weak var dataTitleLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dataImageView.layer.cornerRadius = 10
    }
    
    // MARK: - Public Methods
    
    func configure(data: DataProtocol) {
        dataTitleLabel.text = data.dataName
        
        // Сделано для того чтобы при переиспользовании ячейки
        // не было изображения от предыдущей ячейки
        dataImageView.image = nil
        
        DispatchQueue.global().async {
            guard let imgUrl = URL(string: data.dataImgUrl) else { return }
            guard let imgData = try? Data(contentsOf: imgUrl) else { return }
            
            DispatchQueue.main.async {
                self.dataImageView.image = UIImage(data: imgData)
            }
        }
    }

}
