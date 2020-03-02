//
//  MortyPerson.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 02.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

struct MortyPerson: Decodable {
    let id: Int?
    let name: String?
    let image: String?
}

extension MortyPerson: DataProtocol {
    var dataName: String { return name ?? "" }
    var dataImgUrl: String { return image ?? "" }
}
