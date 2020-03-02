//
//  Pokemon.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 02.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    let name: String?
    let imageUrl: String?
}

extension Pokemon: DataProtocol {
    var dataName: String { return name ?? "" }
    var dataImgUrl: String { return imageUrl ?? "" }
}
