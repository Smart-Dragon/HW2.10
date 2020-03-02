//
//  PokemonList.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 02.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

import Foundation

struct PokemonList: Decodable {
    let cards: [Pokemon]?
}

extension PokemonList: ListProtocol {
    var items: [DataProtocol] { return cards ?? [] }
}
