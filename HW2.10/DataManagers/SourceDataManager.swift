//
//  SourceDataManager.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 02.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

class SourceDataManager {
    static let shared = SourceDataManager()
    
    func getSources() -> [Source] {
        [
            Source(type: .cocktail, title: "Коктейли",
                   url: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail"),
            Source(type: .delish, title: "Блюда",
                   url: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood"),
            Source(type: .pokemon, title: "Покемоны",
                   url: "https://api.pokemontcg.io/v1/cards")
        ]
    }
}
