//
//  Dish.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 02.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

struct Dish: Decodable {
    let idMeal: String?
    let strMeal: String?
    let strMealThumb: String?
}

extension Dish: DataProtocol {
    var dataName: String { return strMeal ?? "" }
    var dataImgUrl: String { return strMealThumb ?? ""}
}
