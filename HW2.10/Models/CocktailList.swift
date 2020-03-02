//
//  CocktailList.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 02.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

struct CocktailList: Decodable {
    let drinks: [Cocktail]?
}

extension CocktailList: ListProtocol {
    var items: [DataProtocol] { return drinks ?? [] }
}
