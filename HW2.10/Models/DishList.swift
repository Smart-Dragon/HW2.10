//
//  DishList.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 02.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

struct DishList: Decodable {
    let meals: [Dish]?
}

extension DishList: ListProtocol {
    var items: [DataProtocol] { return meals ?? [] }
}
