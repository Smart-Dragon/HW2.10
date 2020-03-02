//
//  Сocktail.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 02.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

struct Cocktail: Decodable {
    let idDrink: String?
    let strDrink: String?
    let strDrinkThumb: String?
}

extension Cocktail: DataProtocol {
    var dataName: String { return strDrink ?? "" }
    var dataImgUrl: String { return strDrinkThumb ?? "" }
    var dataDescription: String { return "А тут могло бы быть описание, будь оно в API." }
}
